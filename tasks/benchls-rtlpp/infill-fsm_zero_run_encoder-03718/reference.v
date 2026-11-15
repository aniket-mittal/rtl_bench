module rtlpp_03718  (
    input wire clock, 
    input wire reset,  
    input wire [6:0] i_d,				
    output reg [7:0] o_d,				
    input wire [1:0] state,				
    input wire fire,				
    output wire f_start_i_eq_0,
    output wire f_zeros_i_eq_0,
    output wire f_zeros_cnt_eq_127
);

    // State parameters
    parameter state_start  = 2'd0;
    parameter state_zeros  = 2'd1;
    parameter state_pending = 2'd2;

    reg [7:0] cnt, next_cnt;
    reg [6:0] i_at_0, i_at_0_;			

    // Output assignments
    assign f_start_i_eq_0     = (i_d==0);
    assign f_zeros_i_eq_0     = (i_d==0);
    assign f_zeros_cnt_eq_127 = (cnt==127);

    // Sequential logic for state updates
    always @(posedge clock or negedge reset) begin
        if (!reset) begin
            cnt <= 0;		
            i_at_0 <= 7'b0;
        end else begin
            cnt <= next_cnt;
            i_at_0 <= i_at_0_;
        end
    end
   
    // Combinational logic for next states
    always @(cnt or state or fire or i_at_0 or i_d or f_start_i_eq_0 or f_zeros_i_eq_0 or f_zeros_cnt_eq_127) begin
        next_cnt = cnt;
        i_at_0_ = i_at_0;
        o_d = 8'b0;
        
        if (fire) begin
            case (state)

                state_start: begin
                    i_at_0_ = i_d;
                    if (f_start_i_eq_0) begin
                        next_cnt = 1;
                    end else begin
                        o_d = {1'b0, i_d};
                    end
                end

                state_zeros: begin
                    i_at_0_ = i_d;
                    if (f_zeros_i_eq_0) begin
                        if (f_zeros_cnt_eq_127) begin
                            o_d = 16 | cnt;
                            next_cnt = 0;
                        end else begin
                            next_cnt = cnt + 1;
                        end
                    end
                end

                state_pending: begin
                    o_d = {1'b0, i_at_0};
                end

                default: begin
                    next_cnt = 8'b0;
                    i_at_0_ = 7'b0;
                    o_d = 8'b0;
                end

            endcase 
        end
    end 

endmodule