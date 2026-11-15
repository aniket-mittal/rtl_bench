module origen_207027(
    input clk,
    input nRST,
    input pingpong,
    input [31:0] ram_data,
    input [9:0] ram_addr,
    output reg [15:0] err_count0,
    output reg [15:0] err_count1,
    output reg err
);

reg pingpong0, pingpong1;
reg [31:0] data_reg0, data_reg1;
reg [9:0] ram_addr_reg;
reg err_start;

localparam IDLE = 3'b000, WAIT_SEND = 3'b001, START_SEND = 3'b010, WAIT_END = 3'b011, SEND_END = 3'b100;
reg [2:0] state, next_state;

always @(posedge clk or negedge nRST) begin
    if (!nRST) begin
        pingpong0 <= 0;
        pingpong1 <= 0;
    end else begin
        pingpong0 <= pingpong;
        pingpong1 <= pingpong0;
    end
end

always @(posedge clk or negedge nRST) begin
    if (!nRST) begin
        data_reg0 <= 0;
        data_reg1 <= 0;
        ram_addr_reg <= 0;
        err_count0 <= 0;
        err_count1 <= 0;
        err <= 0;
        err_start <= 0;
        state <= IDLE;
    end else begin
        case (state)
            IDLE: begin
                if (pingpong0 != pingpong1) begin
                    next_state <= WAIT_SEND;
                end else begin
                    next_state <= IDLE;
                end
            end
            WAIT_SEND: begin
                data_reg0 <= ram_data;
                ram_addr_reg <= ram_addr;
                if (ram_data == 32'h3a87c5d6) begin
                    next_state <= START_SEND;
                end else begin
                    ram_addr_reg[9] <= ~ram_addr_reg[9];
                    next_state <= IDLE;
                end
            end
            START_SEND: begin
                data_reg1 <= ram_data;
                ram_addr_reg[8:0] <= ram_addr_reg[8:0] + 1'b1;
                if (ram_addr_reg[8:0] == 9'd250) begin
                    ram_addr_reg[9] <= ~ram_addr_reg[9];
                    ram_addr_reg[8:0] <= 9'd11;
                    next_state <= IDLE;
                end else begin
                    next_state <= START_SEND;
                end
            end
            WAIT_END: begin
                next_state <= SEND_END;
            end
            SEND_END: begin
                next_state <= IDLE;
            end
            default: begin
                next_state <= IDLE;
            end
        endcase

        if (state == WAIT_SEND) begin
            if (ram_data != data_reg0 + 1 && data_reg0 != 0 && data_reg1 != 0) begin
                err_count0 <= err_count0 + 1;
            end
        end

        if (state == START_SEND) begin
            if (ram_addr_reg >= 10'd16 && ram_data != data_reg1 + 32'h04040404 && ram_data != 32'h00010203 && err_start) begin
                err_count1 <= err_count1 + 1;
            end
            data_reg1 <= ram_data;
        end

        state <= next_state;
    end
end

endmodule