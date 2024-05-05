# Remove all generated artifacts.
clean:
	@rm -f ./*.mrpack ./*.zip

# Refresh the index and stage git changes.
refresh:
	packwiz refresh
	@git add .

# Refresh the index and export the modpack.
release: refresh
	packwiz modrinth export

# Open pack.toml for editing the version, and refresh the index.
update-version:
	@$(EDITOR) ./pack.toml:3:12
	packwiz refresh
	@git add .

.PHONY: clean refresh release update-version
.IGNORE: clean refresh release update-version
