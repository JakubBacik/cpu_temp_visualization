########################################################################################################################
# cpu_temp_visualization build stage
########################################################################################################################

FROM alpine:3.17.0 AS build

RUN apk update && \
    apk add --no-cache \
    build-base \
    cmake 

WORKDIR /cpu_temp_visualization

COPY src/ ./src/
COPY CMakeLists.txt .

WORKDIR /cpu_temp_visualization/build

RUN cmake -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build . --parallel 8

########################################################################################################################
# cpu_temp_visualization image
########################################################################################################################

FROM alpine:3.17.0

RUN apk update && \
    apk add --no-cache \
    libstdc++ 

RUN addgroup -S shs && adduser -S shs -G shs
USER shs

COPY --chown=shs:shs --from=build \
    ./cpu_temp_visualization/build/src/cpu_temp_visualization \
    ./app/

ENTRYPOINT [ "./app/cpu_temp_visualization" ]