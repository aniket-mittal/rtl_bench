module rtlpp_07037(
	clock,
	reset,
	start, 
	ready, 
	A,     
	B,     
	R      
);
				
parameter M = 18;  
parameter N = 18;  
parameter K = 1;

parameter ITER = (N/K) + ((N%K) ? 1:0);
parameter K2 = (N%K) ? (N%K):K;

parameter INI   = 2'b00,
		  LOAD  = 2'b01,
		  CALC  = 2'b10,
		  READY = 2'b11; 
				
input clock, reset;
input start;
input [M-1:0] A;
input [N-1:0] B;
output ready;
output [M+N-1:0] R;

reg [M+K-1:0] reg_H;
reg [M-1:0] reg_A;
reg [N-1:0] reg_B;

reg [M-1:0] reg_Ai;
reg [N-1:0] reg_Bi;

reg [1:0] STATE;
reg [1:0] NEXTSTATE;

reg loadA, loadB, loadH;
reg shH, shB;
reg resetQ;

wire [M+K-1:0] fa_sum;
reg [M+K-1:0] mult_A_B;

reg [7:0] Q;
wire [7:0] D;
reg EN;

assign D = Q + 8'b00000001;
assign ready = (STATE == INI || STATE == READY);
assign fa_sum = mult_A_B[M+K-1:0] + { {K{ reg_H[M-1] }}, reg_H[M-1:0]};
assign R = {reg_H[M-1:0], reg_B[N-1:0]};

always @(posedge clock) begin
	if(reset)
		reg_A <= {M{1'b0}};
	else if(loadA)
		reg_A <= reg_Ai;
end

always @(posedge clock) begin
	if(reset)
		reg_Ai <= {M{1'b0}};
	else if(start & ~loadA)
		reg_Ai <= A;
end

always @(posedge clock) begin
	if(reset)
		reg_Bi <= {M{1'b0}};
	else if(start & ~loadB)
		reg_Bi <= B;
end

always @(posedge clock) begin
	if(reset || loadH)
		reg_H <= {(M+K-1){1'b0}};
	else if(shH) begin
		if((N%K) && Q == ITER)
			reg_H <= { {K2{ fa_sum[M+K-1] }}, fa_sum[M+K-1:K2]};
		else
			reg_H <= { {K{ fa_sum[M+K-1] }}, fa_sum[M+K-1:K]};
	end
end

always @(posedge clock) begin
	if(reset)
			reg_B <= {N{1'b0}};
	else if(loadB)
			reg_B <= reg_Bi;
	else if(shB) begin
		if((N%K) && Q == ITER)
			reg_B <= {fa_sum[K2-1:0], reg_B[N-1:K2]};
		else
			reg_B <= {fa_sum[K-1:0], reg_B[N-1:K]};
	end
end

always @* begin
		if(!((N%K) && Q == ITER)) begin
		  case(K)
				3'b001: mult_A_B =  ( (Q != ITER) ? 
				                            ( { {K{reg_A[M-1]}}, reg_A } & {(M+K){reg_B[0]}} ) :
				                           -( { {K{reg_A[M-1]}}, reg_A } & {(M+K){reg_B[0]}} ) );

				3'b010: mult_A_B =  ( { {K{reg_A[M-1]}}, reg_A } & {(M+K){reg_B[0]}} ) +
				                    ( (Q != ITER) ? 
									        ( ( { {K{reg_A[M-1]}}, reg_A } & {(M+K){reg_B[1]}} ) << 1 ) :
				                           -( ( { {K{reg_A[M-1]}}, reg_A } & {(M+K){reg_B[1]}} ) << 1 ) );
									
				3'b011: mult_A_B =    ( { {K{reg_A[M-1]}}, reg_A } & {(M+K){reg_B[0]}} ) +
				                    ( ( { {K{reg_A[M-1]}}, reg_A } & {(M+K){reg_B[1]}} ) << 1 ) +
				                    ( (Q != ITER) ? 
									        ( ( { {K{reg_A[M-1]}}, reg_A } & {(M+K){reg_B[2]}} ) << 2 ):
				                           -( ( { {K{reg_A[M-1]}}, reg_A } & {(M+K){reg_B[2]}} ) << 2 ) );

				3'b100: mult_A_B =    ( { {K{reg_A[M-1]}}, reg_A } & {(M+K){reg_B[0]}} ) +
				                    ( ( { {K{reg_A[M-1]}}, reg_A } & {(M+K){reg_B[1]}} ) << 1 ) +
				                    ( ( { {K{reg_A[M-1]}}, reg_A } & {(M+K){reg_B[2]}} ) << 2 ) +
				                    ( (Q != ITER) ? 
									        ( ( { {K{reg_A[M-1]}}, reg_A } & {(M+K){reg_B[3]}} ) << 3 ):
				                           -( ( { {K{reg_A[M-1]}}, reg_A } & {(M+K){reg_B[3]}} ) << 3 ) );

			endcase		  
		end
		else begin
			case(N%K)
			    2'b01: mult_A_B =  - ( { {K{reg_A[M-1]}}, reg_A } & {(M+K){reg_B[0]}} );

				2'b10: mult_A_B =    ( { {K{reg_A[M-1]}}, reg_A } & {(M+K){reg_B[0]}} ) -
				                     ( ( { {K{reg_A[M-1]}}, reg_A } & {(M+K){reg_B[1]}} ) << 1 );
									
				2'b11: mult_A_B =    ( { {K{reg_A[M-1]}}, reg_A } & {(M+K){reg_B[0]}} ) +
				                     ( ( { {K{reg_A[M-1]}}, reg_A } & {(M+K){reg_B[1]}} ) << 1 ) -
				                     ( ( { {K{reg_A[M-1]}}, reg_A } & {(M+K){reg_B[2]}} ) << 2 );

			endcase
		end
end

always @(posedge clock) begin
	if(reset)
		STATE <= INI;
	else
		STATE <= NEXTSTATE;
end

always @* begin
	case(STATE)
		INI: begin
			if(start)
				NEXTSTATE = LOAD;
			else
				NEXTSTATE = INI;
		end
		
		LOAD: begin
			NEXTSTATE = CALC;
		end
		
		CALC: begin
			if(Q == ITER)
				NEXTSTATE = INI;
			else
				NEXTSTATE = CALC;
		end
		
		READY: begin
			if(start == 0)
				NEXTSTATE = INI;
			else
				NEXTSTATE = READY;
		end
		
	endcase
end

always @* begin
	EN = 0;
	loadA = 0;
	loadB = 0;
	loadH = 0;
	shH = 0;
	shB = 0;
	resetQ = 0;
		
	case(STATE)
	
		LOAD: begin
			loadA = 1;
			loadB = 1;
			loadH = 1;
			resetQ = 1;
		end
		
		CALC: begin
			EN = 1;
			shH = 1;
			shB = 1;
		end
		
	endcase
end

always @(posedge clock) begin
	if(resetQ)
		Q <= 8'b0000001;
	else if (EN)
		Q <= D;
end

endmodule