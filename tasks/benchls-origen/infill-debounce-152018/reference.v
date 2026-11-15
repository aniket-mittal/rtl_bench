module origen_152018(
    input clk,
    input reset,
    input sw,
    output db
);

parameter N = 100000;

reg [2:0] q_reg, q_next;
reg m_tick;

always @(posedge clk, posedge reset) begin
    if (reset) begin
        q_reg <= 3'b0;
    end
    else begin
        q_reg <= q_next;
    end
end

always @(q_reg, sw) begin
    case (q_reg)
        3'b000: begin
            if (sw) begin
                q_next = 3'b001;
            end
            else begin
                q_next = 3'b000;
            end
            m_tick = 1'b0;
        end
        3'b001: begin
            if (sw) begin
                q_next = 3'b010;
            end
            else begin
                q_next = 3'b000;
            end
            m_tick = 1'b0;
        end
        3'b010: begin
            if (sw) begin
                q_next = 3'b011;
            end
            else begin
                q_next = 3'b000;
            end
            m_tick = 1'b0;
        end
        3'b011: begin
            q_next = 3'b100;
            m_tick = 1'b1;
        end
        3'b100: begin
            q_next = 3'b101;
            m_tick = 1'b0;
        end
        3'b101: begin
            if (sw) begin
                q_next = 3'b101;
            end
            else begin
                q_next = 3'b110;
            end
            m_tick = 1'b0;
        end
        3'b110: begin
            if (sw) begin
                q_next = 3'b111;
            end
            else begin
                q_next = 3'b000;
            end
            m_tick = 1'b0;
        end
        3'b111: begin
            q_next = 3'b000;
            m_tick = 1'b1;
        end
    endcase
end

reg [31:0] count;
always @(posedge clk, posedge reset) begin
    if (reset) begin
        count <= 0;
    end
    else if (m_tick) begin
        if (count == N - 1) begin
            count <= 0;
        end
        else begin
            count <= count + 1;
        end
    end
end

assign db = (q_reg == 3'b100);

endmodule