# syntax=docker/dockerfile:1
# ==============================================================================
# --- Stage 1: Unified Application Builder (Alpine) ---
# This stage uses Alpine Linux to create a smaller build environment.
# ==============================================================================
ARG RUBY_VERSION=3.4.6
FROM ruby:${RUBY_VERSION}-alpine AS builder

# 1. Install System Dependencies for Alpine
# We use `apk` and Alpine's package names. `build-base` is for compiling
# gems, and `postgresql-dev` is needed for the `pg` gem's native extension.
RUN apk add --no-cache \
    build-base \
    git \
    postgresql-dev \
    nodejs \
    npm

# 2. Set up the application environment
WORKDIR /app
ENV HANAMI_ENV=production
ENV BUNDLE_PATH="/usr/local/bundle"
ENV BUNDLE_WITHOUT="development:test"

# 3. Install Ruby & JS Dependencies (Leveraging Cache)
COPY Gemfile Gemfile.lock package.json package-lock.json* ./
RUN gem install bundler && \
    bundle install --jobs $(nproc) --retry 3
RUN npm install

# 4. Copy Application Code
COPY . .

# 5. Precompile Assets
RUN bundle exec hanami assets compile

# ==============================================================================
# --- Stage 2: Final Runner Image (Alpine) ---
# The final image is also based on Alpine for a minimal footprint.
# ==============================================================================
FROM ruby:${RUBY_VERSION}-alpine AS runner

# 1. Install only necessary runtime system dependencies
# We only need the postgresql client libraries and timezone data.
RUN apk add --no-cache \
    postgresql-client \
    tzdata

# 2. Create a non-root user for security
RUN addgroup -S anya && adduser -S anya -G anya

# 3. Set up the application environment
WORKDIR /app
ENV HANAMI_ENV=production
ENV PORT=2300
ENV BUNDLE_PATH="/usr/local/bundle"
ENV BUNDLE_WITHOUT="development:test"

# 4. Copy installed gems and application code from the builder stage
COPY --from=builder ${BUNDLE_PATH} ${BUNDLE_PATH}
COPY --from=builder /app /app
RUN chown -R anya:anya /app /usr/local/bundle

# 5. Switch to the non-root user
USER anya

# 6. Expose the application port and define the start command
EXPOSE 2300
CMD ["bundle", "exec", "hanami", "server"]

