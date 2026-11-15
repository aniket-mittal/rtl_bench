// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 51;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_128566 dut (
    .clk(clk),
    .rst(in_vec[50:50]),
    .load(in_vec[49:49]),
    .up_down(in_vec[48:48]),
    .parallel_in(in_vec[47:32]),
    .transition_in(in_vec[31:0]),
    .final_output(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 51'h4ed170be66646;
    stim[1] = 51'h6e0d652ebd7a1;
    stim[2] = 51'h0637cbc429957;
    stim[3] = 51'h2146459834d41;
    stim[4] = 51'h1deddb223750e;
    stim[5] = 51'h191c53ca4e963;
    stim[6] = 51'h3250e94d5566d;
    stim[7] = 51'h1d46b8a93a9e2;
    stim[8] = 51'h3375cffb58b63;
    stim[9] = 51'h2e532b824783b;
    stim[10] = 51'h34e949e8b91b4;
    stim[11] = 51'h1f94bd2c91027;
    stim[12] = 51'h20ee2c76788da;
    stim[13] = 51'h3ec73308ad122;
    stim[14] = 51'h16327bea6f828;
    stim[15] = 51'h271c81e6d01e5;
    stim[16] = 51'h3254736e4a93e;
    stim[17] = 51'h3594534dffdb1;
    stim[18] = 51'h087da5bda3a89;
    stim[19] = 51'h29dd15dd42145;
    stim[20] = 51'h35e4665c243f6;
    stim[21] = 51'h1ac8d4d214880;
    stim[22] = 51'h3f0feb9521e7a;
    stim[23] = 51'h23009cb347173;
    stim[24] = 51'h0c7d5a1b7ad3f;
    stim[25] = 51'h1cecc882421db;
    stim[26] = 51'h2159118e46e8f;
    stim[27] = 51'h302ff4d7462f2;
    stim[28] = 51'h057ae5a0fbd50;
    stim[29] = 51'h303ecb5518002;
    stim[30] = 51'h3bd80335f1e5e;
    stim[31] = 51'h1928585f04c1a;
    stim[32] = 51'h2d293ef70c65d;
    stim[33] = 51'h046fbeb591676;
    stim[34] = 51'h3092622608535;
    stim[35] = 51'h37413d09aa458;
    stim[36] = 51'h179785f2b5201;
    stim[37] = 51'h2b5b7aa6496fa;
    stim[38] = 51'h0fc7ef28d0cde;
    stim[39] = 51'h34b23d8628d02;
    stim[40] = 51'h16eae401751a8;
    stim[41] = 51'h0dbe6f6c0a303;
    stim[42] = 51'h1c09b9dc90122;
    stim[43] = 51'h3de4a2c2e91fc;
    stim[44] = 51'h2aa2a6415039c;
    stim[45] = 51'h005aa050e4cdb;
    stim[46] = 51'h3dc6f0e139b82;
    stim[47] = 51'h1a378fd0a32ef;
    stim[48] = 51'h030a7b04f2b3c;
    stim[49] = 51'h08f5970c64a47;
    stim[50] = 51'h3997cccf3d926;
    stim[51] = 51'h084f757ffea78;
    stim[52] = 51'h07f1320b3bf02;
    stim[53] = 51'h052552478534e;
    stim[54] = 51'h2c0f8d58ae433;
    stim[55] = 51'h39f485a4da0fa;
    stim[56] = 51'h3c989d5ccd242;
    stim[57] = 51'h2b4491585e2e4;
    stim[58] = 51'h2b164606b8ba7;
    stim[59] = 51'h3f224cc154666;
    stim[60] = 51'h1c6334156a4bb;
    stim[61] = 51'h206446bc127b6;
    stim[62] = 51'h35225fde52be2;
    stim[63] = 51'h28e9702f4d8a3;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h11;
      expv[4] = 8'h04;
      expv[5] = 8'h45;
      expv[6] = 8'h64;
      expv[7] = 8'h0e;
      expv[8] = 8'h0f;
      expv[9] = 8'h00;
      expv[10] = 8'h10;
      expv[11] = 8'h84;
      expv[12] = 8'h91;
      expv[13] = 8'he0;
      expv[14] = 8'h70;
      expv[15] = 8'h00;
      expv[16] = 8'hc8;
      expv[17] = 8'h43;
      expv[18] = 8'h05;
      expv[19] = 8'h00;
      expv[20] = 8'hc0;
      expv[21] = 8'h02;
      expv[22] = 8'h46;
      expv[23] = 8'hfa;
      expv[24] = 8'h09;
      expv[25] = 8'h08;
      expv[26] = 8'h00;
      expv[27] = 8'h10;
      expv[28] = 8'h7d;
      expv[29] = 8'ha2;
      expv[30] = 8'h40;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h03;
      expv[34] = 8'h02;
      expv[35] = 8'h02;
      expv[36] = 8'h01;
      expv[37] = 8'h10;
      expv[38] = 8'hb3;
      expv[39] = 8'h24;
      expv[40] = 8'h00;
      expv[41] = 8'h20;
      expv[42] = 8'h23;
      expv[43] = 8'h20;
      expv[44] = 8'h4a;
      expv[45] = 8'h20;
      expv[46] = 8'h01;
      expv[47] = 8'h49;
      expv[48] = 8'h60;
      expv[49] = 8'h51;
      expv[50] = 8'h58;
      expv[51] = 8'h60;
      expv[52] = 8'h5a;
      expv[53] = 8'h7a;
      expv[54] = 8'h48;
      expv[55] = 8'h78;
      expv[56] = 8'h48;
      expv[57] = 8'h88;
      expv[58] = 8'h00;
      expv[59] = 8'h40;
      expv[60] = 8'h00;
      expv[61] = 8'h05;
      expv[62] = 8'h04;
      expv[63] = 8'h04;
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
