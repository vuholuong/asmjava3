<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/43.2.0/ckeditor5.css" />

<style>
.ck {
	padding-left: 20px;
	   border: none !important;
    outline: none !important;
}



.ck.ck-content ul {
  padding-left: 30px;
}

</style>

<body>
    <div class="relative bg-white">
        <div class="px-4 mx-auto">
            <div class="mt-3 rounded-b lg:rounded-b-none lg:rounded-r flex flex-col justify-between leading-normal">
                <div class="pb-5">
                    <h1 class="text-gray-900 font-bold text-4xl">${news.title}</h1>
                    <div class="py-5 text-sm font-regular text-gray-900 flex">
                        <span class="mr-3 flex flex-row items-center">
                            <i class="bx bx-time-five text-lg text-blue-500"></i>
                            <span class="ml-1">${news.createdAtString}</span>
                        </span>

                        <span class="mr-3 flex flex-row items-center">
                            <i class="bx bx-user text-lg text-blue-500"></i>
                            <span class="ml-1">${news.authorString}</span>
                        </span>
                    </div>
                    <hr />
					<div id="news-content"></div>
                </div>
            </div>
        </div>
    </div>

</body>
<script src="https://cdn.ckeditor.com/ckeditor5/43.2.0/ckeditor5.umd.js"></script>
<script>
    const { ClassicEditor, Essentials, Paragraph, Heading, Bold, Italic, Link, List, BlockQuote, Image, MediaEmbed, Table, Font, Alignment, Highlight, Markdown, PasteFromOffice } = CKEDITOR;

    let editor;

    ClassicEditor.create(document.querySelector("#news-content"), {
        plugins: [Essentials, Paragraph, Heading, Bold, Italic, Link, List, BlockQuote, Image, MediaEmbed, Table, Font, Alignment, Highlight, Markdown, PasteFromOffice],
        toolbar: [],
    })
        .then((e) => {
            editor = e;
            editor.enableReadOnlyMode("all");
            editor.setData(`${news.content}`);
        })
        .catch(console.log);
</script>
