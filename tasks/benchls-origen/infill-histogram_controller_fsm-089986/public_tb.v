// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_089986 dut (
    .clock(clk),
    .reset(in_vec[4:4]),
    .start_histogram(in_vec[3:3]),
    .input_memory_read_finished(in_vec[2:2]),
    .all_pixel_written(in_vec[1:1]),
    .all_lines_written(in_vec[0:0]),
    .set_read_address_input_mem(out_vec[7:7]),
    .set_read_address_scratch_mem(out_vec[6:6]),
    .set_write_address_scratch_mem(out_vec[5:5]),
    .shift_scratch_memory_rw_address(out_vec[4:4]),
    .read_data_ready_input_mem(out_vec[3:3]),
    .histogram_computation_done(out_vec[2:2]),
    .extra_writes_en(out_vec[1:1]),
    .read_data_ready_scratch_mem(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h1e;
    stim[1] = 5'h1e;
    stim[2] = 5'h02;
    stim[3] = 5'h0b;
    stim[4] = 5'h0c;
    stim[5] = 5'h0d;
    stim[6] = 5'h0b;
    stim[7] = 5'h06;
    stim[8] = 5'h0c;
    stim[9] = 5'h09;
    stim[10] = 5'h0c;
    stim[11] = 5'h05;
    stim[12] = 5'h04;
    stim[13] = 5'h06;
    stim[14] = 5'h1f;
    stim[15] = 5'h03;
    stim[16] = 5'h0e;
    stim[17] = 5'h03;
    stim[18] = 5'h05;
    stim[19] = 5'h0a;
    stim[20] = 5'h02;
    stim[21] = 5'h04;
    stim[22] = 5'h07;
    stim[23] = 5'h06;
    stim[24] = 5'h01;
    stim[25] = 5'h06;
    stim[26] = 5'h05;
    stim[27] = 5'h0b;
    stim[28] = 5'h03;
    stim[29] = 5'h0f;
    stim[30] = 5'h06;
    stim[31] = 5'h03;
    stim[32] = 5'h08;
    stim[33] = 5'h0b;
    stim[34] = 5'h0a;
    stim[35] = 5'h00;
    stim[36] = 5'h01;
    stim[37] = 5'h06;
    stim[38] = 5'h07;
    stim[39] = 5'h07;
    stim[40] = 5'h07;
    stim[41] = 5'h08;
    stim[42] = 5'h0a;
    stim[43] = 5'h0e;
    stim[44] = 5'h0c;
    stim[45] = 5'h0f;
    stim[46] = 5'h02;
    stim[47] = 5'h09;
    stim[48] = 5'h0c;
    stim[49] = 5'h0a;
    stim[50] = 5'h0b;
    stim[51] = 5'h02;
    stim[52] = 5'h0f;
    stim[53] = 5'h0f;
    stim[54] = 5'h0f;
    stim[55] = 5'h00;
    stim[56] = 5'h0e;
    stim[57] = 5'h04;
    stim[58] = 5'h0e;
    stim[59] = 5'h0a;
    stim[60] = 5'h00;
    stim[61] = 5'h03;
    stim[62] = 5'h02;
    stim[63] = 5'h0a;
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
      expv[3] = 8'h00;
      expv[4] = 8'h80;
      expv[5] = 8'h00;
      expv[6] = 8'h08;
      expv[7] = 8'h00;
      expv[8] = 8'h40;
      expv[9] = 8'h00;
      expv[10] = 8'h01;
      expv[11] = 8'h20;
      expv[12] = 8'h00;
      expv[13] = 8'h10;
      expv[14] = 8'h00;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'h80;
      expv[18] = 8'h00;
      expv[19] = 8'h08;
      expv[20] = 8'h00;
      expv[21] = 8'h80;
      expv[22] = 8'h00;
      expv[23] = 8'h08;
      expv[24] = 8'h00;
      expv[25] = 8'h80;
      expv[26] = 8'h00;
      expv[27] = 8'h08;
      expv[28] = 8'h00;
      expv[29] = 8'h80;
      expv[30] = 8'h00;
      expv[31] = 8'h08;
      expv[32] = 8'h00;
      expv[33] = 8'h80;
      expv[34] = 8'h00;
      expv[35] = 8'h08;
      expv[36] = 8'h00;
      expv[37] = 8'h80;
      expv[38] = 8'h00;
      expv[39] = 8'h08;
      expv[40] = 8'h00;
      expv[41] = 8'h40;
      expv[42] = 8'h00;
      expv[43] = 8'h01;
      expv[44] = 8'h20;
      expv[45] = 8'h00;
      expv[46] = 8'h10;
      expv[47] = 8'h06;
      expv[48] = 8'h00;
      expv[49] = 8'h80;
      expv[50] = 8'h00;
      expv[51] = 8'h08;
      expv[52] = 8'h00;
      expv[53] = 8'h40;
      expv[54] = 8'h00;
      expv[55] = 8'h01;
      expv[56] = 8'h20;
      expv[57] = 8'h00;
      expv[58] = 8'h10;
      expv[59] = 8'h02;
      expv[60] = 8'h80;
      expv[61] = 8'h00;
      expv[62] = 8'h08;
      expv[63] = 8'h00;
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
