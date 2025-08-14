package app.domain.order;

import java.util.UUID;

import app.domain.order.enums.OrderChannel;
import app.domain.order.enums.OrderStatus;
import app.domain.order.enums.PaymentMethod;
import app.domain.order.enums.ReceiptMethod;
import app.domain.BaseEntity;
import app.domain.store.Store;
import app.domain.user.User;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "p_orders")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Builder
public class Orders extends BaseEntity {

	public Orders(UUID ordersId, Store store, User user, Long totalPrice, String deliveryAddress, PaymentMethod paymentMethod, OrderChannel orderChannel, ReceiptMethod receiptMethod, OrderStatus orderStatus, boolean isRefundable, String orderHistory, String requestMessage) {
		this.ordersId = ordersId;
		this.store = store;
		this.user = user;
		this.totalPrice = totalPrice;
		this.deliveryAddress = deliveryAddress;
		this.paymentMethod = paymentMethod;
		this.orderChannel = orderChannel;
		this.receiptMethod = receiptMethod;
		this.orderStatus = orderStatus;
		this.isRefundable = isRefundable;
		this.orderHistory = orderHistory;
		this.requestMessage = requestMessage;
	}

	@Id
	@GeneratedValue
	private UUID ordersId;

	@ManyToOne
	@JoinColumn(name = "store_id", nullable = false)
	private Store store;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user; // nullable (오프라인 주문 고려)

	@Column(nullable = false)
	private Long totalPrice;

	@Column(nullable = false)
	private String deliveryAddress; // 오프라인,포장은 "없음"

	@Column(nullable = false, length = 50)
	@Enumerated(EnumType.STRING)
	private PaymentMethod paymentMethod;

	@Column(nullable = false, length = 20)
	@Enumerated(EnumType.STRING)
	private OrderChannel orderChannel;

	@Column(nullable = false, length = 20)
	@Enumerated(EnumType.STRING)
	private ReceiptMethod receiptMethod;

	@Column(nullable = false, length = 20)
	@Enumerated(EnumType.STRING)
	private OrderStatus orderStatus;

	@Column(nullable = false)
	private boolean isRefundable;

	@Column(nullable = false, columnDefinition = "TEXT")
	private String orderHistory;

	private String requestMessage;


}