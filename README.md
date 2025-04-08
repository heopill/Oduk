
<h1 align="center">🧾 모바일 키오스크 앱 - 오더ㅋ</h1>

<div align="center">
  <img src="https://github.com/user-attachments/assets/1d5af74f-2d20-4058-9207-3c0377677e57" alt="Image" />
</div>

## 📋 프로젝트 설명
**오더ㅋ**는 사용자가 좋아하는 것만 모은 **굿즈샵**을 모티브로 만들어진 앱입니다.

- **오더ㅋ**는 `주문(Order)`과 `웃음 또는 즐거움(ㅋ)`의 합성어로,  
  **즐거움을 주문한다**는 의미를 담고 있습니다.
  
- 또한, '오타쿠'라는 단어처럼  
  **한 분야에 마니아 이상으로 심취한 사람**을 의미하는 뜻을 빌려,  
  **저희도 개발에 오타쿠처럼 심취해보자!** 라는 의지를 담아 네이밍하였습니다.

> 오더ㅋ는 당신이 좋아하는 모든 것을,  
> 즐겁게 그리고 쉽게 **주문**할 수 있도록 돕습니다.

> 모바일 키오스크 환경을 기반으로 한 주문 시스템입니다.  
> 사용자의 편의성과 직관적인 UI/UX를 최우선으로 고려하여 설계하고, 개발하였습니다.

<br/>

## 📝 프로젝트 개요
- 프로젝트명 : 오더ㅋ
- 팀명 : 오합지존(烏合至尊)
- 프로젝트 기간 : 2025.04.07 ~ 2025.04.11
- 목표 : 굿즈를 판매하는 모바일 주문 앱을 만드는 것
<br/>

## 👥 팀원 소개

<table>
  <tr>
    <th>프로필</th>
    <th>이름</th>
    <th>역할</th>
    <th>담당 업무</th>
    <th>GitHub 링크</th>
  </tr>
  <tr>
    <td align="center">
      <a href="https://github.com/heopill">
        <img src="https://github.com/heopill.png" width="100" height="100"/><br/>
      </a>
    </td>
    <td align="center"><b>허성필</b></td>
    <td align="center">🧑‍💼 팀장</td>
    <td>
      - 주문 내역 리스트 화면 구현<br/>
      - README 문서 작성
    </td>
    <td align="center">
      <a href="https://github.com/heopill">heopill</a>
    </td>
  </tr>
  <tr>
    <td align="center">
      <a href="https://github.com/uddt-ds">
        <img src="https://github.com/uddt-ds.png" width="100" height="100"/><br/>
      </a>
    </td>
    <td align="center"><b>이다성</b></td>
    <td align="center">👤 팀원</td>
    <td>
      - 상단 메뉴 카테고리 바 구현<br/>
      - ViewController 연결<br/>
      - Figma 디자인
    </td>
    <td align="center">
      <a href="https://github.com/uddt-ds">uddt-ds</a>
    </td>
  </tr>
  <tr>
    <td align="center">
      <a href="https://github.com/Wonsik1">
        <img src="https://github.com/Wonsik1.png" width="100" height="100"/><br/>
      </a>
    </td>
    <td align="center"><b>전원식</b></td>
    <td align="center">👤 팀원</td>
    <td>
      - '취소하기 / 결제하기' 버튼 화면 구현<br/>
      - 예외 처리 화면 구성
    </td>
    <td align="center">
      <a href="https://github.com/Wonsik1">Wonsik1</a>
    </td>
  </tr>
  <tr>
    <td align="center">
      <a href="https://github.com/yeungrak">
        <img src="https://github.com/yeungrak.png" width="100" height="100"/><br/>
      </a>
    </td>
    <td align="center"><b>최영락</b></td>
    <td align="center">👤 팀원</td>
    <td>
      - 상품 선택 화면 구현
    </td>
    <td align="center">
      <a href="https://github.com/yeungrak">yeungrak</a>
    </td>
  </tr>
</table>


### 🛠️ 공통 작업

- SA(시스템 아키텍처) 작성  
- 스크럼 일지 정리  
- 발표 자료 제작  
- 시연 영상 준비
<br/>

## 📌 개발 환경 (Tech Stack)

- 프론트엔드 → <img src="https://img.shields.io/badge/Swift-F05138?style=flat&logo=Swift&logoColor=white"/>  
  

- 버전 관리 및 협업 저장소 → <img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=GitHub&logoColor=white"/>  
   

- 스크럼 및 문서 정리 → <img src="https://img.shields.io/badge/Notion-000000?style=flat&logo=Notion&logoColor=white"/>  
  

- 실시간 커뮤니케이션 도구로 사용 → <img src="https://img.shields.io/badge/Slack-4A154B?style=flat&logo=Slack&logoColor=white"/>  <img src="https://img.shields.io/badge/ZEP-FFB400?style=flat&logoColor=white"/>
 

- UI/UX 디자인 제작에 사용 → <img src="https://img.shields.io/badge/Figma-F24E1E?style=flat&logo=Figma&logoColor=white"/>  

<br/>
  
## 🌳 브랜치 구조
```
main                  ← 최종 배포 브랜치
└── dev               ← 통합 개발 브랜치
    ├── featButton        ← 버튼 기능 개발 브랜치
    ├── featProductsView  ← 상품 보기 기능 개발 브랜치
    ├── featTopMenuBar    ← 상단 메뉴바 기능 개발 브랜치
    └── featOrderTable    ← 주문 테이블 기능 개발 브랜치
```
<br/>

## 📝 커밋 컨벤션

### ✅ 기본 규칙

- 모든 커밋 메시지 끝에는 작업한 이슈 번호를 **`#n` 형식으로 작성**합니다.  
- 커밋 메시지는 **타입(type) : 내용 (#이슈번호)** 형식으로 작성합니다.

> 예시  
> `feat: 주문 내역 구현 완료 (#2)`

### 🔖 커밋 타입 정리

| 타입        | 설명 |
|-------------|------|
| `feat`      | 새로운 기능 추가 |
| `fix`       | 버그 수정 |
| `build`     | 빌드 관련 파일 수정 또는 패키지 매니저 설정 변경 |
| `chore`     | 자잘한 수정 (빌드, 설정 파일 수정 등) |
| `ci`        | CI 설정 관련 수정 |
| `docs`      | 문서 수정 (README 등) |
| `style`     | 코드 포맷팅, 세미콜론 누락 등 기능에 영향 없는 수정 |
| `refactor`  | 코드 리팩토링 (기능 변화 없이 구조 개선) |
| `test`      | 테스트 코드 추가 및 수정 |

<br/>

## 📱 오더ㅋ 목업 이미지
![Image](https://github.com/user-attachments/assets/31a367a9-7f8d-401a-854f-d2a0a01a49ac)
![Image](https://github.com/user-attachments/assets/735d0fea-3837-4d0d-9ceb-93cfbb074ef6)

<br/>

## 🎨 사용한 컬러 & 폰트

### ✅ Color Palette

<table>
  <thead>
    <tr>
      <th>이름</th>
      <th>컬러 샘플</th>
      <th>HEX 코드</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Main Color</strong></td>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/274deb80-1186-456f-9669-118c5e2f6c40" width="40" height="40">
      </td>
      <td><code>#E53888</code></td>
    </tr>
    <tr>
      <td><strong>Sub Color</strong></td>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/bbac4b81-ecd7-4c46-ab59-30b0abed4ba1" width="40" height="40">
      </td>
      <td><code>#FD8DC2</code></td>
    </tr>
  </tbody>
</table>

> 💡 <strong>Main Color</strong>는 전체 UI의 핵심 포인트로 사용되며,  
> <strong>Sub Color</strong>는 보조 강조 요소에 사용됩니다.

### ✅ Font

| 폰트 이름         | 비고         |
|------------------|--------------|
| **전기안전체**      | 본문 및 일반 UI 텍스트에 사용 |
| **G마켓 산스**     | 타이틀, 강조 텍스트에 사용 |

> 💡 모든 폰트는 프로젝트 내에 임베딩되어 있으며,  
> 가독성과 친근한 분위기를 고려해 선정하였습니다.

#### 🔠 폰트 적용 예시

<img width="458" height="140" alt="폰트 예시 2" src="https://github.com/user-attachments/assets/41cbc146-5940-494f-a06d-6d0f47037009" />
<img width="419" height="140" alt="폰트 예시 1" src="https://github.com/user-attachments/assets/fe2216b9-5542-4956-a7f9-758c50a3b8e2" />

<br/>
<br/>

## ✅ 사용한 UIKit 컴포넌트

| 컴포넌트              | 용도 설명 |
|------------------------|------------------------------------------------------------------|
| `UISegmentedControl`   | 화면 내 카테고리 또는 필터 기능 구현 시 사용. |
| `UICollectionView`     | 특정 메뉴 카테고리 클릭 시, 메뉴 카테고리에 해당하는 메뉴들을 표시할 때 사용. |
| `UITableView`          | 주문한 메뉴들이 표시될 수 있도록 할 때 사용. |
| `UIButton`             | 사용자 액션 유도를 위한 버튼으로, 메뉴 추가/삭제 등의 기능에 사용됨. |

> 💡 UI 요소는 **재사용성**과 **모듈화**를 고려해 구성하였습니다.




