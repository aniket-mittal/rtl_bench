module origen_139535 (
    input wire clk,
    input wire rst,
    input wire [31:0] input_data,
    input wire input_valid,
    output wire input_ready,
    input wire [31:0] feedback_data,
    input wire feedback_valid,
    output wire feedback_ready,
    output wire [31:0] output_data,
    output wire output_valid,
    input wire output_ready,
    output wire [19:0] rdcmd_data,
    output wire rdcmd_valid,
    input wire rdcmd_ready,
    input wire [31:0] mem_data,
    output wire mem_valid
);

    // Cache implementation
    reg [31:0] cache [0:7];
    reg [14:0] cache_tags [0:7];
    reg [7:0] cache_valid;

    // State machine
    reg [1:0] state;
    localparam IDLE = 2'b00;
    localparam READ_CACHE = 2'b01;
    localparam READ_MEM = 2'b10;
    localparam WRITE_CACHE = 2'b11;

    reg [19:0] current_address;
    wire [14:0] tag = current_address[19:5];
    wire [2:0] index = current_address[4:2];
    wire cache_hit = cache_valid[index] && (cache_tags[index] == tag);

    reg [31:0] output_data_reg;
    reg output_valid_reg;
    reg rdcmd_valid_reg;
    reg mem_valid_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            cache_valid <= 8'b0;
            output_valid_reg <= 1'b0;
            rdcmd_valid_reg <= 1'b0;
            mem_valid_reg <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (input_valid && input_ready) begin
                        current_address <= input_data[19:0];
                        state <= READ_CACHE;
                    end
                end

                READ_CACHE: begin
                    if (cache_hit) begin
                        output_data_reg <= cache[index];
                        output_valid_reg <= 1'b1;
                        mem_valid_reg <= 1'b1;
                        state <= IDLE;
                    end else begin
                        rdcmd_valid_reg <= 1'b1;
                        state <= READ_MEM;
                    end
                end

                READ_MEM: begin
                    if (rdcmd_ready) begin
                        rdcmd_valid_reg <= 1'b0;
                    end
                    if (mem_data) begin
                        state <= WRITE_CACHE;
                    end
                end

                WRITE_CACHE: begin
                    cache[index] <= mem_data;
                    cache_tags[index] <= tag;
                    cache_valid[index] <= 1'b1;
                    output_data_reg <= mem_data;
                    output_valid_reg <= 1'b1;
                    mem_valid_reg <= 1'b1;
                    state <= IDLE;
                end
            endcase

            if (output_ready && output_valid) begin
                output_valid_reg <= 1'b0;
                mem_valid_reg <= 1'b0;
            end
        end
    end

    assign input_ready = (state == IDLE);
    assign feedback_ready = 1'b1; // Always ready to receive feedback
    assign output_data = output_data_reg;
    assign output_valid = output_valid_reg;
    assign rdcmd_data = current_address;
    assign rdcmd_valid = rdcmd_valid_reg;
    assign mem_valid = mem_valid_reg;

endmodule