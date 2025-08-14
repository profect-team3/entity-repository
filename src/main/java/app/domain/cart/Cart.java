package app.domain.cart;

import java.util.UUID;

import app.domain.BaseEntity;
import app.domain.user.User;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "p_cart")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Builder
public class Cart extends BaseEntity {

	@Id
	@GeneratedValue
	private UUID cartId;

	@OneToOne
	@JoinColumn(name = "user_id", nullable = false, unique = true)
	private User user;

	public Cart(UUID cartId, User user) {
		this.cartId = cartId;
		this.user = user;
	}

}