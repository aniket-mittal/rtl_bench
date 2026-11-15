module rtlpp_02552 (
    input clk,
    input resetn,    
    input [3:1] r,   
    output reg [3:1] g   
); 
    parameter a=2'b00, b=2'b01, c=2'b10, d=2'b11;
    reg [1:0] state, next_state;

    always @(*) begin
        case (state)
            a: begin
                if (r[1] == 0 && r[2] == 0 && r[3] == 0)
                    next_state = a;
                else if (r[1] == 1)
                    next_state = b;
                else if (r[2] == 1 && r[1] == 0)
                    next_state = c;
                else if (r[3] == 1 && r[1] == 0 && r[2] == 0)
                    next_state = d;
                else 
                    next_state = a; // Default case just in case
            end

            b: begin
                if (r[1] == 0)
                    next_state = a;
                else
                    next_state = b;
            end

            c: begin
                if (r[2] == 0)
                    next_state = a;
                else
                    next_state = c;
            end
            
            d: begin
                if (r[3] == 0)
                    next_state = a;
                else
                    next_state = d;
            end
            
            default: next_state = a; // safe default state
        endcase
    end

    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            state <= a;
        else
            state <= next_state;
    end

    always @(*) begin
        g = 3'b000; // default all outputs to 0
        case (state)
            b: g[1] = 1;
            c: g[2] = 1;
            d: g[3] = 1;
        endcase
    end
endmodule