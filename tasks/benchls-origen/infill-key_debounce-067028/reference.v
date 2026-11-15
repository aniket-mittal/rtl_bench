module origen_067028 (
    input wire clk,
    input wire rst_n,
    input wire [1:0] key_data,
    output reg key_flag,
    output reg [1:0] key_value
);

    reg [1:0] key_data_r;
    reg [19:0] delay_cnt;
    reg key_trigger;

    // Input synchronization
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            key_data_r <= 2'b11;
        else
            key_data_r <= key_data;
    end

    // Debounce counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            delay_cnt <= 20'd0;
        else if (key_data_r == 2'b11)
            delay_cnt <= 20'd0;
        else if (delay_cnt < 20'd1000000)
            delay_cnt <= delay_cnt + 1'b1;
    end

    // Key trigger generation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            key_trigger <= 1'b0;
        else if (delay_cnt == 20'd999999)
            key_trigger <= 1'b1;
        else
            key_trigger <= 1'b0;
    end

    // Key value update
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            key_value <= 2'b00;
        else if (key_trigger)
            key_value <= ~key_data_r;
    end

    // Key flag generation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            key_flag <= 1'b0;
        else
            key_flag <= key_trigger;
    end

endmodule