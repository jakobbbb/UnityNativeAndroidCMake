MAKEFLAGS += --no-print-directory

BUILD_DIR = build
SOURCE_DIRS = src
SOURCE_FILES = $(shell find $(SOURCE_DIRS) -type f -iregex ".*\.\(c\|h\)\(pp\|xx\|\)")
CMAKE_FLAGS =

.PHONY: default
default: install

.PHONY: install
install: build
	$(MAKE) -C $(BUILD_DIR) install

.PHONY: build
build: prepare-build
	$(MAKE) -C $(BUILD_DIR)

.PHONY: build-tests
build-tests: prepare-build
	$(MAKE) -C $(BUILD_DIR) tests

.PHONY: prepare-build
prepare-build:
	[ -d "$(BUILD_DIR)" ] || mkdir $(BUILD_DIR)
	cd $(BUILD_DIR) && cmake $(CMAKE_FLAGS) ..

.PHONY: debug
debug: CMAKE_FLAGS += -DCMAKE_BUILD_TYPE=Debug
debug: default;

.PHONY: android
android: CMAKE_FLAGS += -DCMAKE_SYSTEM_NAME=Android
android: default;


.PHONY: lint
lint:
	@clang-format --version | grep -qE "[1-9][0-9]+\.[0-9]+\.[0-9]+" || \
		(echo "Clang 10 or later is required for linting." && exit 1)
	clang-format -n --Werror $(SOURCE_FILES)

.PHONY: codeformat
codeformat:
	clang-format -i $(SOURCE_FILES)


.PHONY: clean
clean:
	[ -f $(BUILD_DIR)/install_manifest.txt ] && xargs rm < $(BUILD_DIR)/install_manifest.txt || echo "Could not uninstall."
	rm -fr $(BUILD_DIR)/
