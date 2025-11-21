package com.optd.content.dto;

// LocalDate 필드는 제거되었습니다.

public class ContentDTO {

    private Long id; 
    private int rank; 
    private String title;
    private String imageUrl; 

    public ContentDTO() {
    }

    // Getter 및 Setter 메서드
    public Long getId() { 
        return id; 
    }

    public void setId(Long id) { 
        this.id = id; 
    }

    public int getRank() { 
        return rank; 
    }

    public void setRank(int rank) { 
        this.rank = rank; 
    }

    public String getTitle() { 
        return title; 
    }

    public void setTitle(String title) { 
        this.title = title; 
    }

    public String getImageUrl() { 
        return imageUrl; 
    }

    public void setImageUrl(String imageUrl) { 
        this.imageUrl = imageUrl; 
    }
}