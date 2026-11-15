// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10644 dut (
    .clk(clk),
    .reset(in_vec[36:36]),
    .pc_ld(in_vec[35:35]),
    .pc_sel(in_vec[34:34]),
    .pc_inc(in_vec[33:33]),
    .ir_ld(in_vec[32:32]),
    .adr_sel(in_vec[31:31]),
    .W_En(in_vec[30:30]),
    .S_Sel(in_vec[29:29]),
    .D_in(in_vec[28:13]),
    .W_Adr(in_vec[12:10]),
    .R_Adr(in_vec[9:7]),
    .S_Adr(in_vec[6:4]),
    .Alu_Op(in_vec[3:0]),
    .C(out_vec[50:50]),
    .N(out_vec[49:49]),
    .Z(out_vec[48:48]),
    .D_out(out_vec[47:32]),
    .ir_out(out_vec[31:16]),
    .address(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h16629c2b67;
    stim[1] = 37'h14a46eb200;
    stim[2] = 37'h0190b9e6b2;
    stim[3] = 37'h05965a7465;
    stim[4] = 37'h0b423cd2a4;
    stim[5] = 37'h0754012252;
    stim[6] = 37'h095dedb06e;
    stim[7] = 37'h0b8bfcc91a;
    stim[8] = 37'h0a19475da3;
    stim[9] = 37'h03d6aeb418;
    stim[10] = 37'h080189b340;
    stim[11] = 37'h08a2e39167;
    stim[12] = 37'h0b03237cdd;
    stim[13] = 37'h0b7f9dcd2f;
    stim[14] = 37'h081e0f3362;
    stim[15] = 37'h0450d171a9;
    stim[16] = 37'h06f0f86785;
    stim[17] = 37'h0e749c403f;
    stim[18] = 37'h0f675dc0f6;
    stim[19] = 37'h0a79ec1fc8;
    stim[20] = 37'h051e63d3fd;
    stim[21] = 37'h0e18b45b49;
    stim[22] = 37'h050f5c5169;
    stim[23] = 37'h0eafd39b09;
    stim[24] = 37'h01ed1f58bc;
    stim[25] = 37'h0fd7fbb29f;
    stim[26] = 37'h07e969bd06;
    stim[27] = 37'h04b61d1496;
    stim[28] = 37'h045d1ad9fc;
    stim[29] = 37'h0bf310777b;
    stim[30] = 37'h0190260e2b;
    stim[31] = 37'h0595b7db96;
    stim[32] = 37'h01eb5b483b;
    stim[33] = 37'h0a8b28ec4e;
    stim[34] = 37'h005c3f3b06;
    stim[35] = 37'h00b08f3e7e;
    stim[36] = 37'h027fbc0283;
    stim[37] = 37'h00bb712ac7;
    stim[38] = 37'h0ad9b3f50d;
    stim[39] = 37'h02643680fd;
    stim[40] = 37'h006dd6738e;
    stim[41] = 37'h02e4aef50f;
    stim[42] = 37'h0e9f1df25c;
    stim[43] = 37'h0dea4cc074;
    stim[44] = 37'h0be8f3fb05;
    stim[45] = 37'h055fcc8ed4;
    stim[46] = 37'h03d2d26ef9;
    stim[47] = 37'h02927c3d94;
    stim[48] = 37'h0430de1bfe;
    stim[49] = 37'h011dd38fa5;
    stim[50] = 37'h008fb50854;
    stim[51] = 37'h00c1a2a0ee;
    stim[52] = 37'h015e30e99c;
    stim[53] = 37'h0e111b339a;
    stim[54] = 37'h0f02cab33e;
    stim[55] = 37'h08edfbb5c3;
    stim[56] = 37'h0dcd07cc43;
    stim[57] = 37'h09dd253189;
    stim[58] = 37'h08fed735c7;
    stim[59] = 37'h0753d90118;
    stim[60] = 37'h0d0941cb9c;
    stim[61] = 37'h0f2a39186a;
    stim[62] = 37'h0c2990fcae;
    stim[63] = 37'h00e3337f8d;
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
      expv[0] = 51'h1000000000000;
      expv[1] = 51'h1000000000000;
      expv[2] = 51'h1000000000000;
      expv[3] = 51'h1000085cf0000;
      expv[4] = 51'h10000b2d30000;
      expv[5] = 51'h1000011e6ffd3;
      expv[6] = 51'h10000a009ffd4;
      expv[7] = 51'h10000ef6d0000;
      expv[8] = 51'h100005fe6004a;
      expv[9] = 51'h100005fe6a009;
      expv[10] = 51'h2ef6db5750031;
      expv[11] = 51'h10000b5750000;
      expv[12] = 51'h10000b575011b;
      expv[13] = 51'h10000191b0190;
      expv[14] = 51'h10000fcee01ab;
      expv[15] = 51'h10000fcee0199;
      expv[16] = 51'h10000fceea009;
      expv[17] = 51'h10000fcee019a;
      expv[18] = 51'h10000fcee0000;
      expv[19] = 51'h100003aee0000;
      expv[20] = 51'h100003aeeffee;
      expv[21] = 51'h10000f31effee;
      expv[22] = 51'h10000f31e0000;
      expv[23] = 51'h100007ae23aee;
      expv[24] = 51'h100007ae2fcee;
      expv[25] = 51'h1000068fab575;
      expv[26] = 51'h10000bfdd3aee;
      expv[27] = 51'h100004b4d87c3;
      expv[28] = 51'h100004b4d0001;
      expv[29] = 51'h100004b4d4b4d;
      expv[30] = 51'h100009883bfdd;
      expv[31] = 51'h1000081304b4d;
      expv[32] = 51'h10000adbefcee;
      expv[33] = 51'h100005ada3aee;
      expv[34] = 51'h100005ada0028;
      expv[35] = 51'h100005ada4b4d;
      expv[36] = 51'h2baef5ada0028;
      expv[37] = 51'h100005adabfdd;
      expv[38] = 51'h100005ada5ada;
      expv[39] = 51'h100005ada0003;
      expv[40] = 51'h100005ada0004;
      expv[41] = 51'h100005ada21b4;
      expv[42] = 51'h100005ada6eb3;
      expv[43] = 51'h06af95ada4b4d;
      expv[44] = 51'h1000052665266;
      expv[45] = 51'h10000479f6b5f;
      expv[46] = 51'h10000fe642577;
      expv[47] = 51'h0115096939693;
      expv[48] = 51'h1000096936b61;
      expv[49] = 51'h1000096936b61;
      expv[50] = 51'h07711ee9c5266;
      expv[51] = 51'h10000ee9c87c3;
      expv[52] = 51'h10000ee9c6b61;
      expv[53] = 51'h10000f1876b61;
      expv[54] = 51'h10000f1870000;
      expv[55] = 51'h2feb316556eb3;
      expv[56] = 51'h06fb716550d15;
      expv[57] = 51'h10000683e683e;
      expv[58] = 51'h10000e929e929;
      expv[59] = 51'h10000e929701e;
      expv[60] = 51'h100009ec8701f;
      expv[61] = 51'h100004a0e0000;
      expv[62] = 51'h1000051c80000;
      expv[63] = 51'h1000051c89ec8;
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
