//Nullish coalescing operator - 널 병합 연산자
https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing_operator

{
  {
    const name = 'scott';
    const userName = name || 'Guest';
    console.log(userName);
  }
  {
    const name = null;
    const userName = name || 'Guest';
    console.log(userName);
  }
  {
    const name = '';
    const userName = name || 'Guest';
    console.log(userName);
  }
  {
    const num = 0;
    const messsage = num || 'undefinded';
    console.log(message);
  }
  
  //문제 해결 구간 
  {
    const name = '';
    const userName = name ?? 'Guest';
    console.log(`내가 보이니 ==> ${userName} <== 입니다.`);
  }
  {
    const num = 0;
    const message = num ?? 'undefinded';
    console.log(`날[??] 저기 [||]랑 비교하지 말아줘 ==> ${message} <==입니다.`);
  }
}

