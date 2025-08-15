import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.font_manager as fm

def visualize_order_trends():
    """
    orders_log.csv 파일을 읽어 시간대별 주문량 추이를 막대 그래프로 시각화합니다.
    """
    try:
        # CSV 파일 읽기
        df = pd.read_csv('orders_log2.csv')

        # 'created_at' 컬럼을 datetime 형식으로 변환
        df['created_at'] = pd.to_datetime(df['created_at'])

        # 시간(hour) 정보 추출
        df['hour'] = df['created_at'].dt.hour

        # 시간대별 주문량 계산
        orders_by_hour = df.groupby('hour').size()

        # 0시부터 23시까지 모든 시간이 인덱스에 포함되도록 재구성 (빈 시간은 0으로 채움)
        orders_by_hour = orders_by_hour.reindex(range(24), fill_value=0)

        # --- 한글 폰트 설정 (Windows, Mac, Linux에 맞게 수정 필요) ---
        try:
            # Mac의 경우
            plt.rc('font', family='AppleGothic')
        except:
            try:
                # Windows의 경우
                plt.rc('font', family='Malgun Gothic')
            except:
                print("한글 폰트를 찾을 수 없습니다. 기본 폰트로 그래프를 그립니다.")

        plt.rcParams['axes.unicode_minus'] = False # 마이너스 폰트 깨짐 방지
        # --- 폰트 설정 끝 ---

        # 막대 그래프 생성
        plt.figure(figsize=(15, 7))
        orders_by_hour.plot(kind='bar', color='skyblue')

        plt.title('시간대별 총 주문량', fontsize=16)
        plt.xlabel('시간 (Hour)', fontsize=12)
        plt.ylabel('주문 수 (Count)', fontsize=12)
        plt.xticks(rotation=0) # x축 레이블 회전 방지
        plt.grid(axis='y', linestyle='--', alpha=0.7)
        plt.tight_layout()

        # 그래프를 파일로 저장하고 화면에 표시
        plt.savefig('hourly_order_visualization.png')
        print("그래프를 'hourly_order_visualization.png' 파일로 저장했습니다.")
        plt.show()

    except FileNotFoundError:
        print("'orders_log.csv' 파일을 찾을 수 없습니다. 먼저 데이터 생성 스크립트를 실행해주세요.")
    except Exception as e:
        print(f"오류가 발생했습니다: {e}")

if __name__ == '__main__':
    visualize_order_trends()