#!/bin/sh

PACK_BASEURL="https://пак.укр/download"
PACKS_FILE="подарунки.txt"
CACHE_DIR=".подарунок/кеш"
OUTPUT_DIR="подарунок"

if ! [ -f $PACKS_FILE ]; then
	echo "Файл $PACKS_FILE відсутній."
	exit 1
fi

mkdir -p {$CACHE_DIR,$OUTPUT_DIR}

counter=0
found=$(wc -l $PACKS_FILE | cut -d' ' -f1)

echo "Знайдено $found паків."

while read -r line; do
	name=$(echo $line | cut -d' ' -f1)
	version=$(echo $line | cut -d' ' -f2)

	if ! [ -f "$CACHE_DIR/$name-$version.zip" ]; then
		echo "Завантажуємо $name ($version)..."
		wget -q -P "$CACHE_DIR/" "$PACK_BASEURL/$name-$version.zip" > /dev/null

		if [ $? -ne 0 ]; then
			echo "Виникла проблема при завантаженні паку $name ($version). Виходимо."
			exit 1
		fi

		echo "Розпаковуємо $name ($version) до $OUTPUT_DIR/$name..."
		unzip -uo "$CACHE_DIR/$name-$version.zip" -d "$OUTPUT_DIR/$name/" > /dev/null
		if [ $? -ne 0 ]; then
			echo "Виникла проблема при розпакуванні паку $name ($version). Виходимо."
			exit 1
		fi

		echo "Розпаковано $name ($version)"
		counter=$(( $counter + 1 ))
	else
		echo "$name ($version) уже існує в кеші. Оминаємо."
	fi
done < $PACKS_FILE

echo "Інстальовано $counter паків."
