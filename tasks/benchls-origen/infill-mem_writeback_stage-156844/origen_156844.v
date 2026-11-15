module origen_156844(
    input [31:0] aluout,
    input [31:0] Memdata,
    input [4:0] WritetoRFaddrin,
    input MemtoRegW,
    input RegWriteW,
    input [63:0] HILO_data,
    input [31:0] PCin,
    input [1:0] MemReadTypeW,
    input [31:0] EPCD,
    input HI_LO_writeenablein,
    input exception_in,
    input MemWriteW,
    input is_ds_in,

    output reg [63:0] WriteinRF_HI_LO_data,
    output reg [4:0] WritetoRFaddrout,
    output reg HI_LO_writeenableout,
    output reg [31:0] WritetoRFdata,
    output reg RegWrite,
    output reg [31:0] PCout,
    output reg exception_out,
    output reg MemWrite,
    output reg is_ds_out
);

    [MASKED]

endmodule