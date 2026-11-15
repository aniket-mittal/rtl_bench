module origen_154490 (
    input           clk,
    input           rst_n,
    input           cpu_wr,
    input           cpu_rd,
    input    [3:0]  cpu_byte,
    input   [31:0]  cpu_addr,
    input   [31:0]  cpu_wdata,
    output          cpu_rdata_v,
    output  [31:0]  cpu_rdata,
    input           a_ready,
    output          a_valid,
    output   [1:0]  a_opcode,
    output   [3:0]  a_mask,
    output  [31:0]  a_address,
    output  [31:0]  a_data,
    input           d_ready,
    input           d_valid,
    input    [1:0]  d_opcode,
    input   [31:0]  d_data,
    output          trans_over
);

    reg        state, next_state;
    reg        cpu_rdata_v_reg;
    reg [31:0] cpu_rdata_reg;
    reg        a_valid_reg;
    reg  [1:0] a_opcode_reg;
    reg  [3:0] a_mask_reg;
    reg [31:0] a_address_reg;
    reg [31:0] a_data_reg;
    reg        trans_over_reg;

    localparam IDLE = 1'b0, ACTIVE = 1'b1;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (cpu_wr) begin
                    next_state = ACTIVE;
                end else if (cpu_rd) begin
                    next_state = ACTIVE;
                end
            end
            ACTIVE: begin
                if (trans_over_reg) begin
                    next_state = IDLE;
                end
            end
        endcase
    end

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            cpu_rdata_v_reg <= 1'b0;
            cpu_rdata_reg <= 32'b0;
            a_valid_reg <= 1'b0;
            a_opcode_reg <= 2'b0;
            a_mask_reg <= 4'b0;
            a_address_reg <= 32'b0;
            a_data_reg <= 32'b0;
            trans_over_reg <= 1'b0;
        end else begin
            if (state == IDLE) begin
                cpu_rdata_v_reg <= 1'b0;
                a_valid_reg <= 1'b0;
                trans_over_reg <= 1'b0;
                if (cpu_wr) begin
                    a_valid_reg <= 1'b1;
                    a_opcode_reg <= 2'b01;
                    a_mask_reg <= cpu_byte;
                    a_address_reg <= cpu_addr;
                    a_data_reg <= cpu_wdata;
                end else if (cpu_rd) begin
                    a_valid_reg <= 1'b1;
                    a_opcode_reg <= 2'b00;
                    a_mask_reg <= cpu_byte;
                    a_address_reg <= cpu_addr;
                end
            end else begin
                if (d_valid && d_ready) begin
                    cpu_rdata_v_reg <= 1'b1;
                    cpu_rdata_reg <= d_data;
                    trans_over_reg <= 1'b1;
                end
            end
        end
    end

    assign cpu_rdata_v = cpu_rdata_v_reg;
    assign cpu_rdata = cpu_rdata_reg;
    assign a_valid = a_valid_reg;
    assign a_opcode = a_opcode_reg;
    assign a_mask = a_mask_reg;
    assign a_address = a_address_reg;
    assign a_data = a_data_reg;
    assign trans_over = trans_over_reg;

endmodule