// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_190477 dut (
    .pxlClk(clk),
    .rst(in_vec[49:49]),
    .hcnt(in_vec[48:37]),
    .vcnt(in_vec[36:25]),
    .hsize(in_vec[24:13]),
    .vsize(in_vec[12:1]),
    .pause(in_vec[0:0]),
    .pixel_r_out(out_vec[31:24]),
    .pixel_g_out(out_vec[23:16]),
    .pixel_b_out(out_vec[15:8]),
    .pixel_a_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h22086ce303e88;
    stim[1] = 50'h2e43b4fdef2dd;
    stim[2] = 50'h05d2a932cf7e1;
    stim[3] = 50'h1cdb55ae7d552;
    stim[4] = 50'h05aeb4d9fa21a;
    stim[5] = 50'h07d97da0c3e2a;
    stim[6] = 50'h1350b08493d4f;
    stim[7] = 50'h18ef4e72d5ba1;
    stim[8] = 50'h1cbd6afb7e1d2;
    stim[9] = 50'h172bb1daf49ba;
    stim[10] = 50'h119cfcadf33ce;
    stim[11] = 50'h0e2ed96e9c964;
    stim[12] = 50'h19544f6864337;
    stim[13] = 50'h02559ee81f4dd;
    stim[14] = 50'h1973fe1582c22;
    stim[15] = 50'h1abd353ee019f;
    stim[16] = 50'h08e182875d45d;
    stim[17] = 50'h13f70191ad490;
    stim[18] = 50'h1c30700d677dd;
    stim[19] = 50'h189731b802353;
    stim[20] = 50'h083f1cd0d1698;
    stim[21] = 50'h03b1b67094829;
    stim[22] = 50'h1f30b3da46f78;
    stim[23] = 50'h050ba5b868d9c;
    stim[24] = 50'h03d0f29f2e03b;
    stim[25] = 50'h0b83b74aae4cf;
    stim[26] = 50'h0d5571258e178;
    stim[27] = 50'h0e2f1509ba948;
    stim[28] = 50'h0de106178f234;
    stim[29] = 50'h185577bd201ff;
    stim[30] = 50'h15f1101d59c50;
    stim[31] = 50'h1dd167cfa1267;
    stim[32] = 50'h05af3c7df1a0f;
    stim[33] = 50'h02b367fb3c98c;
    stim[34] = 50'h155f7947ef289;
    stim[35] = 50'h0344ecb992848;
    stim[36] = 50'h16cb1ccd5e87f;
    stim[37] = 50'h13b79e5113a21;
    stim[38] = 50'h00c2bef1e5601;
    stim[39] = 50'h12556d98f48ff;
    stim[40] = 50'h0b80d9d67ea7a;
    stim[41] = 50'h1d319d272a610;
    stim[42] = 50'h17cc638a593f5;
    stim[43] = 50'h1097b1cb6a395;
    stim[44] = 50'h177623d53d2d2;
    stim[45] = 50'h098d96c80f94b;
    stim[46] = 50'h16f579e1501a3;
    stim[47] = 50'h125beb9e8c23b;
    stim[48] = 50'h1fc740cda6145;
    stim[49] = 50'h1c49404cac82e;
    stim[50] = 50'h1e8adde2d2ac8;
    stim[51] = 50'h03ed8a9ee98e1;
    stim[52] = 50'h0c4f20a99f7d4;
    stim[53] = 50'h00bec598b8103;
    stim[54] = 50'h1b431286b44ec;
    stim[55] = 50'h02baaffb598a7;
    stim[56] = 50'h1070e5da7e9d1;
    stim[57] = 50'h036aa54aa6222;
    stim[58] = 50'h01a1849df496c;
    stim[59] = 50'h0d19d00f66aaf;
    stim[60] = 50'h009c9d994e464;
    stim[61] = 50'h0dd47620a01a0;
    stim[62] = 50'h19d3be97362f3;
    stim[63] = 50'h14d87b5144ca5;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
