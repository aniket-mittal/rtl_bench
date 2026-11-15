module autovcoder_004434 (
    // -------------
    // Input pins //
    // -------------
    // Master 0
    // Address and control
    input [31:0] HADDRx0,
    input HWRITEx0,
    input [1:0] HTRANSx0,
    input [2:0] HSIZEx0,
    input [2:0] HBURSTx0,
    // Write data
    input [31:0] HWDATAx0,

    // Master 1 (default master)
    // Address and control
    input [31:0] HADDRx1,
    input HWRITEx1,
    input [1:0] HTRANSx1,
    input [2:0] HSIZEx1,
    input [2:0] HBURSTx1,
    // Write data
    input [31:0] HWDATAx1,
    // Master 2
    // Address and control
    input [31:0] HADDRx2,
    input HWRITEx2,
    input [1:0] HTRANSx2,
    input [2:0] HSIZEx2,
    input [2:0] HBURSTx2,
    // Write data
    input [31:0] HWDATAx2,

    // Master 3
    // Address and control
    input [31:0] HADDRx3,
    input HWRITEx3,
    input [1:0] HTRANSx3,
    input [2:0] HSIZEx3,
    input [2:0] HBURSTx3,
    // Write data
    input [31:0] HWDATAx3,

    // Select signals
    input [3:0] HMASTER,
    input [3:0] HMASTERD,
    // --------------
    // Output pins //
    // --------------
    output reg [31:0] HADDR,
    output reg HWRITE,
    output reg [1:0] HTRANS,
    output reg [2:0] HSIZE,
    output reg [2:0] HBURST,
    output reg [31:0] HWDATA
);

  // --------------------------
  // Address and control mux //
  // --------------------------
  // Master 1 is default master.
  [MASKED]

  // -----------------
  // Write data mux //
  // -----------------
  always @(*) begin
    case (HMASTERD)
      4'h0: HWDATA = HWDATAx0;
      4'h2: HWDATA = HWDATAx2;
      4'h3: HWDATA = HWDATAx3;
      default: HWDATA = HWDATAx1;
    endcase
  end

endmodule

