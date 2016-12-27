include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
)

set(
    Tenderbackend_SRCS
    modules/Tender/backend.cpp
    modules/Tender/mytype.cpp
)

# Make the unit test files visible on qtcreator
add_custom_target(Tenderbackend_UNITTEST_QML_FILES ALL SOURCES "tests/unit/tst_mytype.qml")

add_library(Tenderbackend MODULE
    ${Tenderbackend_SRCS}
)

set_target_properties(Tenderbackend PROPERTIES
         LIBRARY_OUTPUT_DIRECTORY Tender)

qt5_use_modules(Tenderbackend Gui Qml Quick)

# Copy qmldir file to build dir for running in QtCreator
add_custom_target(Tenderbackend-qmldir ALL
    COMMAND cp ${CMAKE_CURRENT_SOURCE_DIR}/modules/Tender/qmldir ${CMAKE_CURRENT_BINARY_DIR}/Tender
    DEPENDS ${QMLFILES}
)

# Install plugin file
install(TARGETS Tenderbackend DESTINATION ${QT_IMPORTS_DIR}/Tender/)
install(FILES   modules/Tender/qmldir DESTINATION ${QT_IMPORTS_DIR}/Tender/)
