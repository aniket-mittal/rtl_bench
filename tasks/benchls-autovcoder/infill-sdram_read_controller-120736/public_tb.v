// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_120736 dut (
    .iCLK(clk),
    .iRST(in_vec[31:31]),
    .iTEST_WRITE_DONE(in_vec[30:30]),
    .iWAIT_REQUEST(in_vec[29:29]),
    .iRD_DATA(in_vec[28:13]),
    .iRD_DATAVALID(in_vec[12:12]),
    .iSW(in_vec[11:2]),
    .iUPDATE_FRAME(in_vec[1:1]),
    .iUPDATE_Y(in_vec[0:0]),
    .oRD_EN(out_vec[33:33]),
    .oRD_ADDR(out_vec[32:8]),
    .oDATA(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hb84f97dc;
    stim[1] = 32'h84669e27;
    stim[2] = 32'h6f1a0b21;
    stim[3] = 32'h702e4cbd;
    stim[4] = 32'h319a16e0;
    stim[5] = 32'h0e105bcf;
    stim[6] = 32'h14be92e0;
    stim[7] = 32'h4fc1927d;
    stim[8] = 32'h7637782c;
    stim[9] = 32'h61ef6eaf;
    stim[10] = 32'h1779905a;
    stim[11] = 32'h780a89c0;
    stim[12] = 32'h6dc4f5b3;
    stim[13] = 32'h7f3134de;
    stim[14] = 32'h4b13a3cf;
    stim[15] = 32'h72398a59;
    stim[16] = 32'h2bf34fd1;
    stim[17] = 32'h5e31f790;
    stim[18] = 32'h3b11e49c;
    stim[19] = 32'h465361eb;
    stim[20] = 32'h07dbc742;
    stim[21] = 32'hb39a22e6;
    stim[22] = 32'h4697a404;
    stim[23] = 32'h5686e791;
    stim[24] = 32'ha060ac3d;
    stim[25] = 32'h00782a37;
    stim[26] = 32'h626bd106;
    stim[27] = 32'h54b1f70c;
    stim[28] = 32'h73ef6a34;
    stim[29] = 32'h238bde80;
    stim[30] = 32'h3482457c;
    stim[31] = 32'h21fac071;
    stim[32] = 32'h139a8a82;
    stim[33] = 32'h393382fa;
    stim[34] = 32'h28995b88;
    stim[35] = 32'h4bfcccef;
    stim[36] = 32'h76fcd3b5;
    stim[37] = 32'h13a80b89;
    stim[38] = 32'h56bf5358;
    stim[39] = 32'h1af8f3f9;
    stim[40] = 32'h715538b4;
    stim[41] = 32'h53504479;
    stim[42] = 32'h6039a711;
    stim[43] = 32'h458df75a;
    stim[44] = 32'h0c3f3c07;
    stim[45] = 32'h4b458114;
    stim[46] = 32'h2d773ea2;
    stim[47] = 32'h5b62cbc4;
    stim[48] = 32'h523fcf17;
    stim[49] = 32'h5fab6a73;
    stim[50] = 32'h6d0b0ea1;
    stim[51] = 32'h2cb2bbcf;
    stim[52] = 32'h7dd08fe7;
    stim[53] = 32'h71b95250;
    stim[54] = 32'h729f547e;
    stim[55] = 32'h5e35e152;
    stim[56] = 32'h33568c43;
    stim[57] = 32'h1e989228;
    stim[58] = 32'h16a89607;
    stim[59] = 32'h3af9302c;
    stim[60] = 32'h56830d84;
    stim[61] = 32'h7fb025ba;
    stim[62] = 32'h3b094992;
    stim[63] = 32'h30962db0;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 34'h00000fb00;
      expv[1] = 34'h00001c400;
      expv[2] = 34'h000016400;
      expv[3] = 34'h005919700;
      expv[4] = 34'h0065edc00;
      expv[5] = 34'h0065f79d0;
      expv[6] = 34'h19de65c70;
      expv[7] = 34'h19de64ff4;
      expv[8] = 34'h1993f050c;
      expv[9] = 34'h1993fd5bb;
      expv[10] = 34'h15f560bb1;
      expv[11] = 34'h0b75738bb;
      expv[12] = 34'h0b756b6bb;
      expv[13] = 34'h162d89b27;
      expv[14] = 34'h1bad87989;
      expv[15] = 34'h199e74bf9;
      expv[16] = 34'h19d2dfaf9;
      expv[17] = 34'h19fe8f2f9;
      expv[18] = 34'h19fe8938f;
      expv[19] = 34'h19fe83df1;
      expv[20] = 34'h1d0f4e8f1;
      expv[21] = 34'h000005c00;
      expv[22] = 34'h000008000;
      expv[23] = 34'h00000f200;
      expv[24] = 34'h000018700;
      expv[25] = 34'h000014600;
      expv[26] = 34'h06d1a2000;
      expv[27] = 34'h00d1ae15e;
      expv[28] = 34'h00d1b468f;
      expv[29] = 34'h00d1bd0a5;
      expv[30] = 34'h00d1aaf5e;
      expv[31] = 34'h00d1a0e1c;
      expv[32] = 34'h00839501c;
      expv[33] = 34'h100385f1c;
      expv[34] = 34'h1f039711c;
      expv[35] = 34'h1f0399dca;
      expv[36] = 34'h1de7676ca;
      expv[37] = 34'h1d9db71b7;
      expv[38] = 34'h1ddc46bb7;
      expv[39] = 34'h1ddc47fb5;
      expv[40] = 34'h1d9fd16c7;
      expv[41] = 34'h1d9fc8f8a;
      expv[42] = 34'h1da3ce28a;
      expv[43] = 34'h1db88eb8a;
      expv[44] = 34'h0b389806f;
      expv[45] = 34'h00e0222f9;
      expv[46] = 34'h00e03d461;
      expv[47] = 34'h1460378b9;
      expv[48] = 34'h14603e2b9;
      expv[49] = 34'h02f8b4e6b;
      expv[50] = 34'h0e539d46b;
      expv[51] = 34'h0e75179b9;
      expv[52] = 34'h19de7fc95;
      expv[53] = 34'h1cff24a65;
      expv[54] = 34'h1cff28fca;
      expv[55] = 34'h0fff22a94;
      expv[56] = 34'h0a7f38894;
      expv[57] = 34'h086204594;
      expv[58] = 34'h08620c0c4;
      expv[59] = 34'h00b020544;
      expv[60] = 34'h00b03b0c9;
      expv[61] = 34'h00b02b7d7;
      expv[62] = 34'h1730332d7;
      expv[63] = 34'h12303b6d7;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
