module origen_011377 #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 10,
    parameter DISTR = 0
) (
    input wire clka,
    input wire clkb,
    input wire ena,
    input wire enb,
    input wire wea,
    input wire web,
    input wire [ADDR_WIDTH-1:0] addra,
    input wire [ADDR_WIDTH-1:0] addrb,
    input wire [DATA_WIDTH-1:0] dia,
    input wire [DATA_WIDTH-1:0] dib,
    output reg [DATA_WIDTH-1:0] doa,
    output reg [DATA_WIDTH-1:0] dob
);

    // Memory declaration
    (* ram_style = DISTR ? "distributed" : "block" *)
    reg [DATA_WIDTH-1:0] ram [0:(1<<ADDR_WIDTH)-1];

    // Port A
    always @(posedge clka) begin
        if (ena) begin
            if (wea) begin
                ram[addra] <= dia;
            end
            doa <= ram[addra];
        end
    end

    // Port B
    always @(posedge clkb) begin
        if (enb) begin
            if (web) begin
                ram[addrb] <= dib;
            end
            dob <= ram[addrb];
        end
    end

    // RAM initialization
    integer i;
    initial begin
        for (i = 0; i < (1<<ADDR_WIDTH); i = i + 1) begin
            ram[i] = {DATA_WIDTH{1'b0}};
        end
    end

endmodule