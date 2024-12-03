@echo on

set OPENSSL_NO_VENDOR=1
set "OPENSSL_DIR=%LIBRARY_PREFIX%"
set CARGO_PROFILE_RELEASE_STRIP=symbols
set CARGO_PROFILE_RELEASE_LTO=fat

cargo-bundle-licenses --format yaml --output "%SRC_DIR%\THIRDPARTY.yml" || goto :error
cargo install --locked --bins --no-track --profile release --root %LIBRARY_PREFIX% --path lychee-bin || goto :error

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
