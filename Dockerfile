FROM ekidd/rust-musl-builder:nightly-2020-01-26-openssl11 as build
RUN rustup target add x86_64-unknown-linux-musl
COPY --chown=rust:rust . .
RUN cargo --version
RUN rustc --version
# run doc test using docker rust version
RUN cargo test; echo $?
RUN cargo test --release --target=x86_64-unknown-linux-musl; echo $?

# run doc tests again using latest nightly
RUN rustup toolchain install nightly; rustup default nightly; rustup target add x86_64-unknown-linux-musl
RUN cargo --version
RUN rustc --version
RUN cargo test; echo $?
RUN cargo test --release --target=x86_64-unknown-linux-musl; echo $?

# run doc tests again using latest stable
RUN rustup toolchain install stable; rustup default stable; rustup target add x86_64-unknown-linux-musl
RUN cargo --version
RUN rustc --version
RUN cargo test; echo $?
RUN cargo test --release --target=x86_64-unknown-linux-musl; echo $?
