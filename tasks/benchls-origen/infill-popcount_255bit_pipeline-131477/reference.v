module origen_131477 (
    input wire clk,
    input wire rst,
    input wire [254:0] data_in,
    output reg [7:0] count_out
);

    // Split input into 16-bit chunks (16 chunks of 15 bits, 1 chunk of 15 bits)
    wire [3:0] chunk_counts [15:0];
    
    genvar i;
    generate
        for (i = 0; i < 15; i = i + 1) begin : chunk_counter
            count_ones_16bit counter (
                .data(data_in[16*i +: 16]),
                .count(chunk_counts[i])
            );
        end
    endgenerate
    
    count_ones_15bit counter_last (
        .data(data_in[254:240]),
        .count(chunk_counts[15])
    );

    // Pipeline stage 1: Add pairs of chunk counts
    reg [4:0] stage1_sums [7:0];
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (int j = 0; j < 8; j = j + 1) begin
                stage1_sums[j] <= 5'b0;
            end
        end else begin
            for (int j = 0; j < 8; j = j + 1) begin
                stage1_sums[j] <= chunk_counts[2*j] + chunk_counts[2*j+1];
            end
        end
    end

    // Pipeline stage 2: Add pairs of stage1 sums
    reg [5:0] stage2_sums [3:0];
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (int j = 0; j < 4; j = j + 1) begin
                stage2_sums[j] <= 6'b0;
            end
        end else begin
            for (int j = 0; j < 4; j = j + 1) begin
                stage2_sums[j] <= stage1_sums[2*j] + stage1_sums[2*j+1];
            end
        end
    end

    // Pipeline stage 3: Add pairs of stage2 sums
    reg [6:0] stage3_sums [1:0];
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            stage3_sums[0] <= 7'b0;
            stage3_sums[1] <= 7'b0;
        end else begin
            stage3_sums[0] <= stage2_sums[0] + stage2_sums[1];
            stage3_sums[1] <= stage2_sums[2] + stage2_sums[3];
        end
    end

    // Pipeline stage 4: Final sum
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count_out <= 8'b0;
        end else begin
            count_out <= stage3_sums[0] + stage3_sums[1];
        end
    end

endmodule

module count_ones_16bit (
    input wire [15:0] data,
    output reg [3:0] count
);
    always @(*) begin
        count = data[0] + data[1] + data[2] + data[3] + 
                data[4] + data[5] + data[6] + data[7] + 
                data[8] + data[9] + data[10] + data[11] + 
                data[12] + data[13] + data[14] + data[15];
    end
endmodule

module count_ones_15bit (
    input wire [14:0] data,
    output reg [3:0] count
);
    always @(*) begin
        count = data[0] + data[1] + data[2] + data[3] + 
                data[4] + data[5] + data[6] + data[7] + 
                data[8] + data[9] + data[10] + data[11] + 
                data[12] + data[13] + data[14];
    end
endmodule