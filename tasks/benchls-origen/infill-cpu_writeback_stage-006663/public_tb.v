// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 160;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_006663 dut (
    .clock(clk),
    .reset(in_vec[67:67]),
    .state(in_vec[66:66]),
    .cf(in_vec[65:65]),
    .hit(in_vec[64:64]),
    .mem_ir(in_vec[63:48]),
    .d_datain(in_vec[47:32]),
    .reg_C(in_vec[31:16]),
    .cachedata(in_vec[15:0]),
    .wb_ir(out_vec[159:144]),
    .reg_C1(out_vec[143:128]),
    .all(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hca95166d5472d471b;
    stim[1] = 68'hd92d381bd15144e0a;
    stim[2] = 68'h78c71fc8271f8bfa3;
    stim[3] = 68'h761184acc1188ba20;
    stim[4] = 68'h34263f371cb771aa2;
    stim[5] = 68'h07deb87c496e27c56;
    stim[6] = 68'h154ddb5899debdbf9;
    stim[7] = 68'h2f3540fdce2635ae1;
    stim[8] = 68'h3fedc367f5ae92c37;
    stim[9] = 68'h25280ed8ec894d69f;
    stim[10] = 68'h60887af5ca01dfe60;
    stim[11] = 68'hc9c144c117f75fd2f;
    stim[12] = 68'h6b65079d4dfaa176c;
    stim[13] = 68'hc98d23452782ac6cf;
    stim[14] = 68'h16f52cc8c5ef94a36;
    stim[15] = 68'h3e2823446c0780787;
    stim[16] = 68'h6c4f7321ce0654aa5;
    stim[17] = 68'h5e63591bd7a49bbe9;
    stim[18] = 68'h73f56d79bdccaef0c;
    stim[19] = 68'h00003695edc23cc40;
    stim[20] = 68'h6bc26a23b092911ea;
    stim[21] = 68'h511741831901821cd;
    stim[22] = 68'h23a1843fe3969a676;
    stim[23] = 68'h0aba481f6f1c66b1b;
    stim[24] = 68'h7456b600c9b2f8979;
    stim[25] = 68'h41c279fa34de60cb0;
    stim[26] = 68'h6415a2829c4357046;
    stim[27] = 68'h775df57e319d33503;
    stim[28] = 68'h023cdb82ee8b46892;
    stim[29] = 68'h16068988ce8476867;
    stim[30] = 68'h17be223edfb88f93e;
    stim[31] = 68'h4d7badb77ca21195f;
    stim[32] = 68'h4e3dceae902d3b4d8;
    stim[33] = 68'h0b634a8d42361dfe2;
    stim[34] = 68'h4682d4c23d0c1bcae;
    stim[35] = 68'h233ac8a0ba0940fe5;
    stim[36] = 68'h39081ac09b2e0607a;
    stim[37] = 68'h13895dc03eb963d76;
    stim[38] = 68'h1f462aafb6c14af7a;
    stim[39] = 68'h2ceeb26a548fefeb4;
    stim[40] = 68'h2b61654e3ff4c8f7b;
    stim[41] = 68'h024a95ccb89157ed3;
    stim[42] = 68'h14edea75a8246e452;
    stim[43] = 68'h0f579b5feae01d419;
    stim[44] = 68'h1f98e16ecaa0e6f63;
    stim[45] = 68'h15b22e1f287d31e88;
    stim[46] = 68'h1281eb8f4c7c92b49;
    stim[47] = 68'h5ab0180c1b8ec14fa;
    stim[48] = 68'h3a56f7c77b16945b5;
    stim[49] = 68'h061cfdcc42a48c8c7;
    stim[50] = 68'h4625a1fec92ca0e97;
    stim[51] = 68'h453acff16d5551bca;
    stim[52] = 68'h5c49c4a00877fb84e;
    stim[53] = 68'h5a987cffa9703c8bc;
    stim[54] = 68'h7be9152dd94f51f79;
    stim[55] = 68'h54f8653c6a5caceb7;
    stim[56] = 68'h1a7c04652d58644fd;
    stim[57] = 68'h3f9b596a8148e85d8;
    stim[58] = 68'h32bc4b6d8f460fadb;
    stim[59] = 68'h3cd6ed4fa42c55186;
    stim[60] = 68'h74b7614a5ef1cef73;
    stim[61] = 68'h746939210f5bd5491;
    stim[62] = 68'h5689187423b7ace97;
    stim[63] = 68'h255c8951e31a463ad;
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
      expv[0] = 160'h0000000000000000000000000000000000000000;
      expv[1] = 160'h0000000000000000000000000000000000000000;
      expv[2] = 160'h0000000000000000000000000000000000000000;
      expv[3] = 160'h8c7171f800000000000000000000000000000000;
      expv[4] = 160'h6118118800000000000000000000000000000000;
      expv[5] = 160'h6118118800000000000000000000000000000000;
      expv[6] = 160'h6118118800000000000000000000000000000000;
      expv[7] = 160'h6118118800000000000000000000000000000000;
      expv[8] = 160'h6118118800000000000000000000000000000000;
      expv[9] = 160'h6118118800000000000000000000000000000000;
      expv[10] = 160'h6118118800000000000000000000000000000000;
      expv[11] = 160'h0000000000000000000000000000000000000000;
      expv[12] = 160'h0000000000000000000000000000000000000000;
      expv[13] = 160'h0000000000000000000000000000000000000000;
      expv[14] = 160'h0000000000000000000000000000000000000000;
      expv[15] = 160'h0000000000000000000000000000000000000000;
      expv[16] = 160'h0000000000000000000000000000000000000000;
      expv[17] = 160'hc4f7e06500000000000000000000000000000000;
      expv[18] = 160'he6357a4900000000000000000000000000000000;
      expv[19] = 160'h3f56dcca00000000000000000000000000000000;
      expv[20] = 160'h3f56dcca00000000000000000000000000000000;
      expv[21] = 160'hbc26092900000000000000000000000000000000;
      expv[22] = 160'h117421cd00000000000000000000000000000001;
      expv[23] = 160'h117421cd00000000000000000000000000000001;
      expv[24] = 160'h117421cd00000000000000000000000000000001;
      expv[25] = 160'h456b9b2f00000000000000000000000000000001;
      expv[26] = 160'h1c274de600000000000000000000000000000001;
      expv[27] = 160'h415ac43500000000000000000000000000000001;
      expv[28] = 160'h75df19d300000000000000000000000000000001;
      expv[29] = 160'h75df19d300000000000000000000000000000001;
      expv[30] = 160'h75df19d300000000000000000000000000000001;
      expv[31] = 160'h75df19d300000000000000000000000000000001;
      expv[32] = 160'hd7baca2100000000000000000000000000000001;
      expv[33] = 160'he3dc02d300000000000000000000000000000001;
      expv[34] = 160'he3dc02d300000000000000000000000000000001;
      expv[35] = 160'h682dd0c100000000000000000000000000000001;
      expv[36] = 160'h682dd0c100000000000000000000000000000001;
      expv[37] = 160'h682dd0c100000000000000000000000000000001;
      expv[38] = 160'h682dd0c100000000000000000000000000000001;
      expv[39] = 160'h682dd0c100000000000000000000000000000001;
      expv[40] = 160'h682dd0c100000000000000000000000000000001;
      expv[41] = 160'h682dd0c100000000000000000000000000000001;
      expv[42] = 160'h682dd0c100000000000000000000000000000001;
      expv[43] = 160'h682dd0c100000000000000000000000000000001;
      expv[44] = 160'h682dd0c100000000000000000000000000000001;
      expv[45] = 160'h682dd0c100000000000000000000000000000001;
      expv[46] = 160'h682dd0c100000000000000000000000000000001;
      expv[47] = 160'h682dd0c100000000000000000000000000000001;
      expv[48] = 160'hab01b8ec00000000000000000000000000000001;
      expv[49] = 160'hab01b8ec00000000000000000000000000000001;
      expv[50] = 160'hab01b8ec00000000000000000000000000000001;
      expv[51] = 160'h625a92ca00000000000000000000000000000001;
      expv[52] = 160'h53acd55500000000000000000000000000000001;
      expv[53] = 160'hc49c877f00000000000000000000000000000001;
      expv[54] = 160'ha987970300000000000000000000000000000001;
      expv[55] = 160'hbe9194f500000000000000000000000000000001;
      expv[56] = 160'h4f86a5ca00000000000000000000000000000001;
      expv[57] = 160'h4f86a5ca00000000000000000000000000000001;
      expv[58] = 160'h4f86a5ca00000000000000000000000000000001;
      expv[59] = 160'h4f86a5ca00000000000000000000000000000001;
      expv[60] = 160'h4f86a5ca00000000000000000000000000000001;
      expv[61] = 160'h4b76ef1c00000000000000000000000000000001;
      expv[62] = 160'h4693f5bd00000000000000000000000000000001;
      expv[63] = 160'h68913b7a00000000000000000000000000000001;
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
