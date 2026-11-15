// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 59;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_023412 dut (
    .clk(clk),
    .rst_n(in_vec[58:58]),
    .reg_cp0_addr(in_vec[57:53]),
    .reg_cp0_sel(in_vec[52:50]),
    .val_from_cp0(in_vec[49:49]),
    .ex_cp0_write_enable(in_vec[48:48]),
    .ex_cp0_write_addr(in_vec[47:43]),
    .ex_cp0_sel(in_vec[42:40]),
    .val_from_ex(in_vec[39:8]),
    .mm_cp0_write_enable(in_vec[7:7]),
    .mm_cp0_write_addr(in_vec[6:6]),
    .mm_cp0_sel(in_vec[5:5]),
    .val_from_mm(in_vec[4:4]),
    .wb_cp0_write_enable(in_vec[3:3]),
    .wb_cp0_write_addr(in_vec[2:2]),
    .wb_cp0_sel(in_vec[1:1]),
    .val_from_wb(in_vec[0:0]),
    .val_output(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 59'h2912147f546986a;
    stim[1] = 59'h30d1bbcae176152;
    stim[2] = 59'h6f109602a7ae2be;
    stim[3] = 59'h72253230c2a27e3;
    stim[4] = 59'h558f159b00d5fb6;
    stim[5] = 59'h69bcc0d7f47eb25;
    stim[6] = 59'h50cf7457e6caafd;
    stim[7] = 59'h5c9b18219069ab5;
    stim[8] = 59'h7b23c7d969594b2;
    stim[9] = 59'h6fc50517677a490;
    stim[10] = 59'h708992cf7f7eac8;
    stim[11] = 59'h4875d0c78aaa340;
    stim[12] = 59'h596818d385bb0c1;
    stim[13] = 59'h52740897a69570b;
    stim[14] = 59'h44225c2b5f86a0a;
    stim[15] = 59'h780861df72c38c9;
    stim[16] = 59'h658a2edfe710f5b;
    stim[17] = 59'h747be0a79189244;
    stim[18] = 59'h77f491188a754b9;
    stim[19] = 59'h4531dab6ff02d7e;
    stim[20] = 59'h53adb9655dbb31f;
    stim[21] = 59'h47db20863a10ad3;
    stim[22] = 59'h5ad10932eadeb10;
    stim[23] = 59'h4269adf02ecda0d;
    stim[24] = 59'h56e597d2adc5dd5;
    stim[25] = 59'h4617f827a183053;
    stim[26] = 59'h5f3201995ef7af8;
    stim[27] = 59'h62c3f00c3871ec2;
    stim[28] = 59'h45b1bd1f2f6c514;
    stim[29] = 59'h70f5c6f8a87b968;
    stim[30] = 59'h4a946cd2555a9fe;
    stim[31] = 59'h48b7124f07102b2;
    stim[32] = 59'h478268c786c62be;
    stim[33] = 59'h63a8a2ae5e42301;
    stim[34] = 59'h476b579eb979005;
    stim[35] = 59'h45c3b2aa6c10783;
    stim[36] = 59'h7dbd81b8a4931f6;
    stim[37] = 59'h4ca49db7d68e134;
    stim[38] = 59'h512e68f59ea6d49;
    stim[39] = 59'h44f33d2613d4f4c;
    stim[40] = 59'h593c55b965f294d;
    stim[41] = 59'h5377f5d666b0a16;
    stim[42] = 59'h6b021b7c9bbb0bb;
    stim[43] = 59'h4475a9964aa5014;
    stim[44] = 59'h4fb8ebbddc32051;
    stim[45] = 59'h4f0092032b4054a;
    stim[46] = 59'h662688b41f21ed0;
    stim[47] = 59'h7ea98018280f2f6;
    stim[48] = 59'h620af2e5c995674;
    stim[49] = 59'h724ab9705509ac4;
    stim[50] = 59'h5e8d829f82b51ca;
    stim[51] = 59'h789cb3342f58456;
    stim[52] = 59'h46d5d10eefbaaca;
    stim[53] = 59'h5fc500d6ba4099e;
    stim[54] = 59'h6bcf34ddf0ac8e3;
    stim[55] = 59'h715201fe36e8122;
    stim[56] = 59'h65436950053e2e2;
    stim[57] = 59'h79300a5ef963567;
    stim[58] = 59'h5ca766be0c442cd;
    stim[59] = 59'h47cb1874cf87e3e;
    stim[60] = 59'h6fabb3d36238761;
    stim[61] = 59'h7021ce138dc96eb;
    stim[62] = 59'h44b76b9588a17df;
    stim[63] = 59'h7935db6e8c85960;
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
      expv[3] = 32'h00000001;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000001;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000001;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000001;
      expv[12] = 32'h00000001;
      expv[13] = 32'h00000001;
      expv[14] = 32'h00000001;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000001;
      expv[18] = 32'h00000001;
      expv[19] = 32'h00000001;
      expv[20] = 32'h00000001;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000001;
      expv[24] = 32'h00000001;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000001;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000001;
      expv[29] = 32'h00000001;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000001;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000001;
      expv[34] = 32'h00000001;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000001;
      expv[37] = 32'h00000001;
      expv[38] = 32'h00000001;
      expv[39] = 32'h00000001;
      expv[40] = 32'h00000001;
      expv[41] = 32'h00000001;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000001;
      expv[44] = 32'h00000001;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000001;
      expv[47] = 32'h00000001;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000001;
      expv[58] = 32'h00000001;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000001;
      expv[61] = 32'h00000001;
      expv[62] = 32'h00000001;
      expv[63] = 32'h00000001;
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
