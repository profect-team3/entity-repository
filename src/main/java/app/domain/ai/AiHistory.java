package app.domain.ai;

import java.util.UUID;

import app.domain.BaseEntity;
import app.domain.ai.enums.AiRequestStatus;
import app.domain.ai.enums.ReqType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "p_ai_history")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
public class AiHistory extends BaseEntity {

	@Column(nullable = false)
	private Long userId;

	@Id
	@GeneratedValue
	private UUID aiRequestId;

	@Column(nullable = false)
	private String storeName;

	@Column(nullable = false)
	private String menuName;

	@Column(nullable = false)
	@Enumerated(EnumType.STRING)
	private ReqType reqType;

	@Column(nullable = false)
	private String promptText;

	private String generatedContent;

	@Column(nullable = false)
	@Enumerated(EnumType.STRING)
	private AiRequestStatus status;

}
