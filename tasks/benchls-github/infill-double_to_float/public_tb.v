// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  double_to_float dut (
    .clk(clk),
    .input_a(in_vec[66:3]),
    .input_a_stb(in_vec[2:2]),
    .output_z_ack(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .output_z(out_vec[33:2]),
    .output_z_stb(out_vec[1:1]),
    .input_a_ack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h5f57bffe7617407db;
    stim[1] = 67'h12e02d4d30d857c07;
    stim[2] = 67'h7c4afb838ecef4f98;
    stim[3] = 67'h094ebc9e3249bee84;
    stim[4] = 67'h608bfad73d3716836;
    stim[5] = 67'h742f3f5d1edebd626;
    stim[6] = 67'h20beb848da273c590;
    stim[7] = 67'h5addb2d1bc2ad3ae6;
    stim[8] = 67'h05649ae128895299a;
    stim[9] = 67'h427268bdcf42e4072;
    stim[10] = 67'h3b5e82c7fe221201c;
    stim[11] = 67'h1fa0cb11ca70d8cec;
    stim[12] = 67'h10fef0ec61e3e6648;
    stim[13] = 67'h48cca95fb3d8fe204;
    stim[14] = 67'h490fbb4d2ad93457e;
    stim[15] = 67'h4705574cd4223f9d4;
    stim[16] = 67'h72f58a404ca5300d2;
    stim[17] = 67'h407c7bfe0b5c9de6e;
    stim[18] = 67'h3f1d0e970909054bc;
    stim[19] = 67'h347071089b794c004;
    stim[20] = 67'h541a0f2e8fab100b6;
    stim[21] = 67'h4876bf0f986cf25de;
    stim[22] = 67'h3269a9ddf3a49a9c6;
    stim[23] = 67'h2f6050cce8ade49a2;
    stim[24] = 67'h768204b8c78f49bf2;
    stim[25] = 67'h00bfa574c636684a2;
    stim[26] = 67'h456430b8b057de384;
    stim[27] = 67'h5b075e693b152d56e;
    stim[28] = 67'h6e0d07f42fa500ce0;
    stim[29] = 67'h3fd1de5cc00b23688;
    stim[30] = 67'h3710fceac26269dea;
    stim[31] = 67'h7402be9d88fb5bc4e;
    stim[32] = 67'h04624e745de67fbbc;
    stim[33] = 67'h6ce54a725e901d400;
    stim[34] = 67'h09f3be80977bf2966;
    stim[35] = 67'h555b2931a5c345a02;
    stim[36] = 67'h745dcf087d8aa6aca;
    stim[37] = 67'h0dd3084863f961c4e;
    stim[38] = 67'h6cfdfa3eeedd9f2c4;
    stim[39] = 67'h47817442ee08bcb8e;
    stim[40] = 67'h739dc2efaafc5e5da;
    stim[41] = 67'h3ad4ddd43025cc6b8;
    stim[42] = 67'h125c0ec822ea0bfae;
    stim[43] = 67'h6ad9981390777e878;
    stim[44] = 67'h1507275944b391178;
    stim[45] = 67'h7ccddbe9e7bbe46fe;
    stim[46] = 67'h26ea34ab121da4616;
    stim[47] = 67'h12bbc5ce0fef011bc;
    stim[48] = 67'h0bb9278359ea3af3a;
    stim[49] = 67'h4a7fa8cd3e798ab02;
    stim[50] = 67'h0970d474ea3be4668;
    stim[51] = 67'h709f09e307b28dcde;
    stim[52] = 67'h6f262274bf9794c1c;
    stim[53] = 67'h1cc6dd6caddbf200e;
    stim[54] = 67'h55896ff750e933f6e;
    stim[55] = 67'h5656ca8be132c5dde;
    stim[56] = 67'h20406db8189167e9c;
    stim[57] = 67'h25b9d2f81aa60ec94;
    stim[58] = 67'h521043caad5cebf44;
    stim[59] = 67'h74b6eb10325fcad06;
    stim[60] = 67'h637eccf299a1cec10;
    stim[61] = 67'h63141e4a9873da824;
    stim[62] = 67'h391e064d1f68a1a88;
    stim[63] = 67'h0a8425bdd41509de6;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'hxxxxxxxxx;
      expv[2] = 34'hxxxxxxxxx;
      expv[3] = 34'hxxxxxxxxx;
      expv[4] = 34'hxxxxxxxxx;
      expv[5] = 34'hxxxxxxxxx;
      expv[6] = 34'hxxxxxxxxx;
      expv[7] = 34'hxxxxxxxxx;
      expv[8] = 34'hxxxxxxxxx;
      expv[9] = 34'hxxxxxxxxx;
      expv[10] = 34'hxxxxxxxxx;
      expv[11] = 34'hxxxxxxxxx;
      expv[12] = 34'hxxxxxxxxx;
      expv[13] = 34'hxxxxxxxxx;
      expv[14] = 34'hxxxxxxxxx;
      expv[15] = 34'hxxxxxxxxx;
      expv[16] = 34'hxxxxxxxxx;
      expv[17] = 34'hxxxxxxxxx;
      expv[18] = 34'hxxxxxxxxx;
      expv[19] = 34'hxxxxxxxxx;
      expv[20] = 34'hxxxxxxxxx;
      expv[21] = 34'hxxxxxxxxx;
      expv[22] = 34'hxxxxxxxxx;
      expv[23] = 34'hxxxxxxxxx;
      expv[24] = 34'hxxxxxxxxx;
      expv[25] = 34'hxxxxxxxxx;
      expv[26] = 34'hxxxxxxxxx;
      expv[27] = 34'hxxxxxxxxx;
      expv[28] = 34'hxxxxxxxxx;
      expv[29] = 34'hxxxxxxxxx;
      expv[30] = 34'hxxxxxxxxx;
      expv[31] = 34'hxxxxxxxxx;
      expv[32] = 34'h000000002;
      expv[33] = 34'h000000002;
      expv[34] = 34'h000000002;
      expv[35] = 34'h000000000;
      expv[36] = 34'h000000001;
      expv[37] = 34'h000000001;
      expv[38] = 34'h000000000;
      expv[39] = 34'h000000000;
      expv[40] = 34'h000000000;
      expv[41] = 34'h000000000;
      expv[42] = 34'h000000000;
      expv[43] = 34'h000000000;
      expv[44] = 34'h000000000;
      expv[45] = 34'h000000000;
      expv[46] = 34'h000000000;
      expv[47] = 34'h000000000;
      expv[48] = 34'h000000000;
      expv[49] = 34'h000000000;
      expv[50] = 34'h000000000;
      expv[51] = 34'h000000000;
      expv[52] = 34'h000000000;
      expv[53] = 34'h000000000;
      expv[54] = 34'h000000000;
      expv[55] = 34'h000000000;
      expv[56] = 34'h000000000;
      expv[57] = 34'h000000000;
      expv[58] = 34'h000000000;
      expv[59] = 34'h000000000;
      expv[60] = 34'h000000000;
      expv[61] = 34'h000000000;
      expv[62] = 34'h000000000;
      expv[63] = 34'h000000000;
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
