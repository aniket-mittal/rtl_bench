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

    always @(*) begin
        // Select the write-back data based on MemtoRegW
        if (MemtoRegW) begin
            case (MemReadTypeW)
                2'b00: WritetoRFdata = {{24{Memdata[7]}}, Memdata[7:0]}; // Sign-extend byte
                2'b01: WritetoRFdata = {{16{Memdata[15]}}, Memdata[15:0]}; // Sign-extend halfword
                2'b10: WritetoRFdata = Memdata; // Word
                default: WritetoRFdata = 32'b0;
            endcase
        end else begin
            WritetoRFdata = aluout;
        end

        // Determine write-back data for register file or HI/LO registers
        WriteinRF_HI_LO_data = HILO_data;
        WritetoRFaddrout = WritetoRFaddrin;
        HI_LO_writeenableout = HI_LO_writeenablein;

        // Generate the RegWrite signal
        RegWrite = (exception_in) ? 1'b0 : RegWriteW;

        PCout = PCin;
        exception_out = exception_in;
        MemWrite = MemWriteW;
        is_ds_out = is_ds_in;
    end

endmodule