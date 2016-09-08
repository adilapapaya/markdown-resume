UNAME := $(shell uname)

# Build all layouts in the layouts folder
nothing:
	@echo Make nothing

example:
	cd ./templates; \
	for name in `find . -mindepth 1 -maxdepth 1 -type d | sed -e 's^.\/^^'` ; do \
		echo $$name; \
		mkdir ../examples/output/$$name; \
		..//bin/md2resume html --template $$name ../examples/source/sample.md ../examples/output/$$name/; \
		../bin/md2resume pdf --template $$name ../examples/source/sample.md ../examples/output/$$name/; \
	done; \
	cd ../;

# make just the 'papaya' example using md2resume_dev.php.
# this bypasses needing to commit to github then update and run.
papaya-example:
	cd ./templates; \
		mkdir ../examples/output/papaya; \
		php ../md2resume_dev.php html --template papaya ../examples/source/sample.md ../examples/output/papaya/; \
		php ../md2resume_dev.php pdf --template papaya ../examples/source/sample.md ../examples/output/papaya/; \
	cd ../;

resume:
	cd ./templates; \
		mkdir ../examples/output/papaya; \
		php ../md2resume_dev.php html --template papaya ../examples/source/adila.md ../examples/output/papaya/; \
		php ../md2resume_dev.php pdf --template papaya ../examples/source/adila.md ../examples/output/papaya/; \
	cd ../;
# make the mixu-layout examples ------------------	
# mixu-layout-examples:
# 	for name in `find ./mixu-layout-examples -mindepth 1 -maxdepth 1 -type d | sed -e 's/.\/layouts\///'` ; do \
# 		./bin/generate-md --layout $$name --output ./output/$$name/; \
# 	done

# copy-to-hpr:
# 	# copy the folder to hpr
# 	cp -r papaya-markdown-example/output/* ~/Desktop/Papaya/hpr/test;
# 	cp ~/Desktop/Papaya/hpr/test/README.html ~/Desktop/Papaya/hpr/test/index.html;
# 	scp -r ~/Desktop/Papaya/hpr/test/* adila@adilapapaya.com:/var/www/adilapapaya.com/test/;
 
# preview:
# ifeq ($(UNAME), Linux)
# 	xdg-open output/papaya/index.html
# endif
# ifeq ($(UNAME), Darwin)
# 	open output/papaya/index.html
# endif
