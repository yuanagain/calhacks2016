
gitadd:
	git add *.R

clean:
	rm -rf *.o *~

countlines:
	find ./ -name '*.R' | xargs wc -l
