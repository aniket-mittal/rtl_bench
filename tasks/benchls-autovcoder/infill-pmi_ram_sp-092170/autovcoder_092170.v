module autovcoder_092170 #(
    parameter pmi_addr_depth = 32,
    parameter pmi_addr_width = 5,
    parameter pmi_data_width = 8,
    parameter pmi_init_file = "none",
    parameter pmi_init_file_format = "binary",
    parameter pmi_family = "EC"
) (
    input [(pmi_addr_width-1):0] Address,
    input [(pmi_data_width-1):0] Data,
    input Clock,
    input WE,
    input ClockEn,
    input Reset,
    output reg [(pmi_data_width-1):0] Q
)  /* synthesis syn_black_box */;
  //pragma translate_off

  integer                        h;
  reg                            memchg = 0;
  reg                            wre_reg;
  reg     [(pmi_data_width-1):0] din_reg;
  reg     [(pmi_addr_width-1):0] waddr_reg;
  reg     [(pmi_addr_width-1):0] raddr_reg;

  reg     [(pmi_data_width-1):0] data_out;

  reg     [  pmi_data_width-1:0] mem        [(2**pmi_addr_width)-1:0];

  //Function to calculate log2 of depth
  function integer clogb2(input integer depth);
    begin
      for (clogb2 = 0; depth > 0; clogb2 = clogb2 + 1) depth = depth >>> 1;
    end
  endfunction  // clogb2

  //Error Checks
  //Check for Address_width vs Address_depth
  initial begin
    if (clogb2(pmi_addr_depth - 1) > pmi_addr_width) begin
      $display("\nError! Address depth can not exceed (2**pmi_addr_width)!");
      ;
    end
    //These families don't support init files
    if ( ( (pmi_family == "EC") || (pmi_family == "XP") ||
          (pmi_family == "XO") || (pmi_family == "LPTM") ||
          (pmi_family == "ECP") || (pmi_family == "ECP2") || (pmi_family == "ECP2M") ) &&
        (pmi_init_file != "none") )
	begin
      $display("\nError! This family doesn't support init files!");
      ;
    end
  end

  //initialize the Memory. 

  initial begin
    if (pmi_init_file == "none") begin
      if ( (pmi_family != "EC") && (pmi_family != "XP") &&
           (pmi_family != "XO") && (pmi_family != "LPTM") &&
           (pmi_family != "ECP") && (pmi_family != "ECP2") && (pmi_family != "ECP2M") )
        for (h = 0; h < 2 ** pmi_addr_width; h = h + 1) mem[h] = {pmi_data_width{1'b0}};
      else  //Initialize memories of other families to X's
        for (h = 0; h < 2 ** pmi_addr_width; h = h + 1) mem[h] = {pmi_data_width{1'bX}};
    end else if ((pmi_init_file_format == "binary") && (pmi_init_file != "none")) begin
      $readmemb(pmi_init_file, mem);
    end else if ((pmi_init_file_format == "hex") && (pmi_init_file != "none")) begin
      $readmemh(pmi_init_file, mem);
    end
  end  // initial begin

       // Latch the address and data in for writing
       // Registers are rising edge enabled
  always @(posedge Clock) begin
    if ((pmi_family == "SC") || (pmi_family == "SCM")) begin
      wre_reg   <= WE && ClockEn;
      din_reg   <= Data;
      waddr_reg <= Address;
    end
  end

  always @(posedge Clock) begin
    if ((pmi_family != "SC") && (pmi_family != "SCM")) begin
      wre_reg   <= WE && ClockEn;
      din_reg   <= Data;
      waddr_reg <= Address;
    end
  end

  always @(Address) begin
    raddr_reg = Address;
  end

  always @(negedge Clock) begin
    if ((wre_reg === 1'b1) && ((pmi_family == "SC") || (pmi_family == "SCM"))) begin
      mem[waddr_reg] <= din_reg;
      memchg <= ~memchg;
    end
  end

  always @(din_reg, waddr_reg, wre_reg) begin
    if ((wre_reg === 1'b1) && ((pmi_family != "SC") && (pmi_family != "SCM"))) begin
      mem[waddr_reg] = din_reg;
      memchg = ~memchg;
    end
  end

  [MASKED]

  always @(posedge Reset, posedge Clock) begin
    if (Reset) Q <= 0;
    else if (ClockEn) begin
      Q <= data_out;
    end else Q <= Q;
  end

  //pragma translate_on

endmodule

