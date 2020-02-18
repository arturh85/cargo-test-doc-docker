FROM ekidd/rust-musl-builder:nightly-2020-01-26-openssl11 as build
RUN rustup target add x86_64-unknown-linux-musl
COPY --chown=rust:rust . .
RUN cargo test
