# Branch Strategy & Protection Rules

## Branch Structure

- **main**: 프로덕션(배포) 브랜치. 안정된 코드만 머지.
- **develop**: 스테이징(통합 테스트) 브랜치. 기능 브랜치 통합.
- **feature/***: 새로운 기능/개발용 브랜치. 예: `feature/login`, `feature/api-refactor`.

## Protection Rules

- **PR 리뷰**: 머지 전 최소 1명 이상 승인 필수
- **필수 체크**: analyze/test/build 등 통과 필수
- **Force-push 금지**: 보호 브랜치에 강제 푸시 금지