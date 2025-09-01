# GIT 커밋 컨벤션

## 1. 브랜치 이름 규칙

```jsx
새 기능 추가
feature/(이슈 코드)-(기능 이름)
 - ex) feature/MS-STR-001-초기-비밀번호-설정
    
이외 브랜치 이름 
fix - 버그 수정 시
refactor - 코드 리팩토링
docs - 문서 관련
style - 디자인 관련 수정
```

## 2. 브랜치 생성

<img width="1505" height="788" alt="image" src="https://github.com/user-attachments/assets/038cd69d-7215-42d4-8d2b-10bc25d06abf" />


이슈 화면에서 Create a branch 버튼 클릭
→ feature/(이슈 코드)-(이슈 내용) 형태로 이름 작성
→ Branch source를 develop 로 선택
→ Create branch 

<img width="507" height="196" alt="image" src="https://github.com/user-attachments/assets/3f792662-0ad8-4db2-aa3b-1640dc9cf15d" />

Create branch 클릭하면 뜨는 창

→ 복사 후 명령어 입력

```
git fetch origin
→ 원격 저장소의 모든 브랜치 정보 업데이트

git checkout feature/1-이슈-생성-테스트
→ 그 브랜치를 로컬로 가져오고 바로 작업 브랜치로 전환
```

## 3. 커밋 메세지 컨벤션

```jsx
feat: 새로운 기능 추가
- ex) feat: 로그인 기능 추가

fix: 버그 수정
- ex) fix: 로그인 오류 수정

docs: 문서 변경 (예: README 수정)
- ex) docs: API 문서 업데이트

style: 코드 스타일 변경 (코드 동작에 영향을 주지 않는 변경)
- ex) style: 들여쓰기 수정

refactor: 코드 리팩토링 (기능 변경 없이 코드 개선)
- ex) refactor: 로그인 로직 리팩토링

test: 테스트 코드 추가/수정
- ex) test: 로그인 테스트 추가

chore: 기타 변경 사항 (빌드, 설정 파일 등)
- ex) chore: 의존성 패키지 업데이트
```

`태그: 제목`의 형태이며, `:`뒤에만 space가 있음에 유의한다.

## 4. commit & push

1. 작업하던 브랜치에서 작업내용 임시 저장

```bash
git stash
```

- **git stash** : 변경된 내용들을 임시 저장 후 변경 전으로 복귀
→ git stash pop : 내용 복윈, stash 목록에서 제거
→ git stash apply : 내용 복원, stash 목록에 남김
1. develop 브랜치로 이동

```bash
git checkout develop
```

1. 원격 저장소의 최신 내용 받아오기

```bash
git pull origin develop
```

1. 작업 중인 feature 브랜치로 이동

```bash
git checkout feature/MS-STR-001-초기 비밀번호 설정
```

1. 최신 develop 브랜치의 내용 병합 

```bash
git merge develop
```

1. stash에 저장한 내용 반영 → 충돌 발생 시 해결

```bash
git stash pop
```

1. 작업 완료 후 commit & push

```bash
git add .
git commit -m "feat: 초기 비밀번호 설정 구현"
git push 
```

1. github 홈페이지로 이동해서 create&pullrequest
    - reviewers는 [**park-Jihun679**](https://github.com/park-Jihun679)로 설정하고 ****pull request 요청
    
2. (merge 후) develop에 merge된 브랜치 삭제

```bash
git branch -d feature/MS-STR-001-초기 비밀번호 설정
```

→ 원격 브랜치도 삭제

1. 자주 쓰이는 명령어
- **git status** : 파일 변경사항, 스테이징(git add) 상태를 알 수 있다.
(add 전 변경된 파일 확인 or add 후 확인 용으로 자주 사용)
- **git log** : 커밋 히스토리 확인 
→ git log --oneline 으로 요약 형태의 커밋 내역 확인 가능
- **git reset (파일명)** : 스테이징(git add) 된 파일을 스테이징 취소 (파일 내용 변경 x)
→ git reset . 으로 스테이징된 모든 파일을 스테이징 취소 가능
- **git branch** : 로컬에 존재하는 브랜치 목록 출력 및 현재 브랜치 확인

…

+ git bash 한글 깨짐 현상 생길 때 

```bash
git config --global core.quotepath false
```
