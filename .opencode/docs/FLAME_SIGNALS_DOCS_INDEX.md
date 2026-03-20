# Flame Signals API Quick Link Map (v0.0.3)

이 문서는 Flame 엔진용 경량 시그널 시스템인 `flame_signals`의 핵심 API를 정리한 문서입니다.

## 📌 핵심 구성 요소 (Core Components)

| 카테고리 | 주요 내용 | 공식 문서 링크 |
| :--- | :--- | :--- |
| **Setup** | `HasSignals` 믹스인 적용 방법 | [📖 pub.dev](https://pub.dev/packages/flame_signals) |
| **Defining Signals** | `FlameSignal` 상속 및 데이터 정의 | [📖 API Ref](https://pub.dev/documentation/flame_signals/latest/flame_signals/FlameSignal-class.html) |
| **Sending** | `SendSignals` 믹스인 및 `addSignal` 사용 | [📖 API Ref](https://pub.dev/documentation/flame_signals/latest/flame_signals/SendSignals-mixin.html) |
| **Listening** | `FlameSignalListenable` 및 `onSignal<T>` 수신 | [📖 API Ref](https://pub.dev/documentation/flame_signals/latest/flame_signals/FlameSignalListenable-mixin.html) |

## 🛠️ 주요 클래스 상세

| 클래스/믹스인 | 역할 |
| :--- | :--- |
| **HasSignals** | `FlameGame`에 추가하여 게임 내 시그널 시스템을 활성화합니다. |
| **FlameSignal** | 모든 시그널 객체의 베이스 클래스입니다. |
| **SendSignals** | 컴포넌트에서 시그널을 외부로 전송할 때 사용합니다. |
| **FlameSignalListenable** | 컴포넌트에서 특정 타입의 시그널을 구독할 때 사용합니다. |

---
**에이전트 참조 지침:** 컴포넌트 간의 직접적인 참조를 피하고, 이 시그널 시스템을 활용하여 모듈 간 결합도를 낮추십시오.
