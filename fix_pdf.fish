function fix_pdf --argument-names file --description "Fix a PDF by OCR-ing it, rotating pages and deskewing it..."
	brapt ensure ocrmypdf
    ocrmypdf --rotate-pages --deskew --language fra+eng $file $file
end
