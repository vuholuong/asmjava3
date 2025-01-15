<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://cdn.ckeditor.com/ckeditor5/43.2.0/ckeditor5.css" />
<div class="bg-gray-100">
	<jsp:include page="/components/news-table.jsp"></jsp:include>
	<br />
	<jsp:include page="/components/news-form.jsp"></jsp:include>
</div>

<script src="https://cdn.ckeditor.com/ckeditor5/43.2.0/ckeditor5.umd.js"></script>

<script>
    const { ClassicEditor, Essentials, Paragraph, Heading, Bold, Italic, Link, List, BlockQuote, Image, MediaEmbed, Table, Font, Alignment, Highlight, Markdown, PasteFromOffice } = CKEDITOR;

    let editor;

    ClassicEditor.create(document.querySelector("#news-editor"), {
        plugins: [Essentials, Paragraph, Heading, Bold, Italic, Link, List, BlockQuote, Image, MediaEmbed, Table, Font, Alignment, Highlight, Markdown, PasteFromOffice],
        toolbar: [
            "heading",
            "|",
            "bold",
            "italic",
            "link",
            "blockQuote",
            "|",
            "bulletedList",
            "numberedList",
            "imageUpload",
            "mediaEmbed",
            "insertTable",
            "codeBlock",
            "|",
            "fontSize",
            "fontFamily",
            "fontColor",
            "fontBackgroundColor",
            "alignment",
            "highlight",
            "undo",
            "redo",
        ],
        mediaEmbed: {
            previewsInData: true, // Allow embedding media
        },
    })
        .then((e) => (editor = e))
        .catch(console.log);

    
    
    
    function newNews() {
        document.getElementById("news-form-id").value = "";
        let title = document.getElementById("news-form-title");
        title.value = "";
        document.getElementById("news-form-description").value = "";
        editor.setData("");

        title.focus();
    }

    function deleteNews(newsId) {
        const modal = document.getElementById("modal-id");
        modal.classList.remove("hidden");

        const cancel = document.getElementById("cancel-delete-btn");
        const confirm = document.getElementById("confirm-delete-btn");

        cancel.onclick = (e) => {
            modal.classList.add("hidden");
        };

        confirm.onclick = (e) => {
        	        fetch("/StudentManagement/admin/news?id=" + newsId, {
        	            method: "DELETE",
        	            headers: {
        	                "Content-Type": "text/plain",
        	            },
        	        })
        	            .then((response) => {
        	                if (!response.ok) {
        	                    throw new Error("Failed to delete the resource");
        	                } else {
        	                    location.reload();
        	                }
        	            })
        	            .catch((error) => {
        	                console.error("Error:", error);
        	            });
        };
        

    }

    function setNewsData(id) {
        fetch("/StudentManagement/api/news/" + id)
            .then((response) => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.json();
            })
            .then((data) => {
                document.getElementById("news-form-id").value = data.id;
                document.getElementById("news-form-title").value = data.title;
                document.getElementById("news-form-description").value = data.description;
                editor.setData(data.content.replace(/\\n/g, "\n").trim());
                document.getElementById("news-form-title").focus();
            })
            .catch((error) => {
                console.error("There was a problem with the fetch operation:", error);
            });
    }
</script>
