# Bonfire Bloc API Quick Link Map (v0.0.2)

이 문서는 Bonfire 엔진과 Bloc 상태 관리 라이브러리를 연동하는 `bonfire_bloc`의 핵심 API를 정리한 문서입니다.

## 📌 핵심 구성 요소 (Core Components)

| 카테고리 | 주요 내용 | 공식 문서 링크 |
| :--- | :--- | :--- |
| **Setup** | `BonfireBlocGame` 사용 방법 | [📖 pub.dev](https://pub.dev/packages/bonfire_bloc) |
| **State Management** | 게임 상태와 Bloc 연동 | [📖 Examples](https://pub.dev/packages/bonfire_bloc/example) |
| **Components** | `BlocComponent` 및 `BlocListener` 활용 | [📖 API Ref](https://pub.dev/documentation/bonfire_bloc/latest/) |

## 🛠️ 주요 클래스 상세

| 클래스/믹스인 | 역할 |
| :--- | :--- |
| **BonfireBlocGame** | Bloc 기능을 지원하는 Bonfire 게임 클래스입니다. |
| **BonfireBlocComponent** | 특정 Bloc의 상태를 구독하고 반응하는 게임 컴포넌트입니다. |
| **BonfireBlocListener** | 상태 변화에 따라 일회성 액션(다이얼로그 표시 등)을 수행할 때 사용합니다. |

---
**에이전트 참조 지침:** 복잡한 게임 상태(인벤토리, 퀘스트, 플레이어 스탯)는 Bloc을 통해 관리하고, UI와 게임 엔진 간의 동기화를 위해 이 패키지를 활용하십시오.
