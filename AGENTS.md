# Global Development Standards: Bonfire RPG (ex1)

이 문서는 모든 AI 에이전트가 공유하는 핵심 개발 지침입니다. 개별 에이전트의 지침보다 우선순위가 높습니다.

## 1. 아키텍처 원칙 (Core Architecture)
- **Decoupling First:** 모듈 간 직접 참조(`import`)를 최소화하고, `lib/core/events.dart`의 `EventEmitter`를 통한 이벤트 기반 통신을 의무화합니다.
- **Flame Lifecycle:** 모든 컴포넌트는 `onLoad`, `update`, `render` 사이클 내에서만 동작하도록 설계합니다.
- **Dependency Management:** 새로운 패키지 추가 시 반드시 `game-engineer`의 검토를 거쳐야 합니다.

## 2. 코딩 스타일 및 명명 규칙 (Style Guide)
- **Typing:** 명확한 `enum`과 `class`를 사용하여 데이터 타입을 정의합니다. (예: `EnemyType`, `MapLayer`)
- **Logging:** 운영 코드에서 `print` 사용을 지양하고, 시스템 이벤트를 로깅할 때는 `[Module] Message` 형식을 사용합니다.
- **Formatting:** Dart의 공식 스타일 가이드(Lints)를 준수합니다.

## 3. 검증 및 테스트 (QA & Validation)
- **Verification:** 모든 코드 변경 후에는 `flutter test`를 실행하여 회귀 오류를 확인합니다.
- **Performance:** `GameLoop.tickRate`에 영향을 주는 무거운 연산은 `compute`나 비동기 처리를 고려합니다.
- **Cleanup:** `onRemove`에서 등록된 이벤트 리스너와 타이머를 반드시 해제하여 메모리 누수를 방지합니다.

## 4. 에이전트 간 협업 (Collaboration)
- **Review System:** `combat-designer`나 `map-designer`의 결과물은 `game-engineer`가 전체 시스템과의 호환성을 최종 검토합니다.
- **Asset Compliance:** 모든 리소스 처리는 `pipeline-engineer`가 정의한 최적화 규칙을 따릅니다.
