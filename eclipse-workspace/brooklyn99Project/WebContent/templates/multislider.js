var slides= document.querySelector('.slides'),
    slide=document.querySelectorAll('.slides li'),
    currentIdx=1,
    slideCount=slide.length,
    slideWidth=13,
    slideMargin=3,
    prevBtn=document.querySelector(".prev"),
    nextBtn=document.querySelector(".next");

  slides.style.width=(slideWidth+slideMargin)*slideCount-slideMargin+'rem';
  

  function moveSlide(num){
      slides.style.left=-num*(slideWidth+slideMargin)+'rem';
     currentIdx=num;
    }

  
  nextBtn.addEventListener('click',function(){
      if(currentIdx<slideCount-5){
      moveSlide(currentIdx+1);}
      else{
      moveSlide(0);}
  });

  prevBtn.addEventListener('click',function(){
      if(currentIdx>0){
          moveSlide(currentIdx-1);
      }
  })
  
  