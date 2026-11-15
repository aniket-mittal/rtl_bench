module origen_129978 (
    input wire clk,
    input wire we,
    input wire [10:0] addr,
    input wire [23:0] data,
    output wire [23:0] out
);

    // Internal signals
    wire [23:0] mem_dout;
    reg [23:0] mem_din;
    reg mem_we;
    reg [10:0] mem_addr;

    // Instantiate the memory generator IP core
    memory_generator_ip mem_gen (
        .clka(clk),
        .ena(1'b1),
        .wea(mem_we),
        .addra(mem_addr),
        .dina(mem_din),
        .douta(mem_dout)
    );

    // Memory interface logic
    always @(posedge clk) begin
        mem_we <= we;
        mem_addr <= addr;
        mem_din <= data;
    end

    // Output assignment
    assign out = mem_dout;

endmodule

// Placeholder module for memory_generator_ip
module memory_generator_ip (
    input wire clka,
    input wire ena,
    input wire wea,
    input wire [10:0] addra,
    input wire [23:0] dina,
    output reg [23:0] douta
);

    // Placeholder memory
    reg [23:0] mem [0:2047];

    always @(posedge clka) begin
        if (ena) begin
            if (wea) begin
                mem[addra] <= dina;
            end
            douta <= mem[addra];
        end
    end

endmodule