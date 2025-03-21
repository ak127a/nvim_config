file_name=$1

awk -F ' ERROR ' '/ ERROR / {
    sub(/^[[:space:]]+/, "", $2)
    print $2
}' "$file_name" | \
    sort | uniq -c

awk -F ' ERROR ' '/ ERROR / {
    sub(/^[[:space:]]+/, "", $2)
    print $2
}' "$file_name" | sort | uniq -c
