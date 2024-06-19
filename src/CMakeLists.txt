
set(TARGET cpu_temp_visualization)

add_executable(${TARGET}
        main.cpp)

target_compile_features(${TARGET} PUBLIC
        cxx_std_17)
