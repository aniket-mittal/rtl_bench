module rtlpp_06396(
    input clk,
    input [7:0] in,
    input reset,    
    output [23:0] out_bytes,
    output done
); 

    reg[1:0] state, next_state;
    reg[23:0] inp;
    parameter A = 2'd0, B = 2'd1, C = 2'd2, D = 2'd3;

    always @(*) begin
        case(state)
            A: next_state = (in[3]) ? B : A;
            B: next_state = C;
            C: next_state = D;
            D: next_state = (in[3]) ? B : A;
        endcase
    end

    always @(posedge clk) begin
        if(reset)
            state <= A;
        else
            state <= next_state;
    end

    assign done = (state == D);

    always @(posedge clk) begin
        if(reset) 
            inp <= 24'd0;
        else begin
            case(next_state)
                B: inp[23:16] <= in;
                C: inp[15:8] <= in;
                D: inp[7:0] <= in;
            endcase
        end
    end

    assign out_bytes = inp; 

endmodule