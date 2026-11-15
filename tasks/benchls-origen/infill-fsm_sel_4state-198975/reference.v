module origen_198975(
    input m_sec,
    input rst,
    input ck,
    output reg [1:0] sel
);

    localparam S0 = 2'b00;
    localparam S1 = 2'b01;
    localparam S2 = 2'b10;
    localparam S3 = 2'b11;

    reg [1:0] state, next_state;

    always @(posedge ck or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            S0: begin
                if (m_sec)
                    next_state = S1;
                else
                    next_state = S0;
                sel = S0;
            end
            S1: begin
                if (m_sec)
                    next_state = S2;
                else
                    next_state = S1;
                sel = S1;
            end
            S2: begin
                if (m_sec)
                    next_state = S3;
                else
                    next_state = S2;
                sel = S2;
            end
            S3: begin
                if (m_sec)
                    next_state = S0;
                else
                    next_state = S3;
                sel = S3;
            end
        endcase
    end

endmodule