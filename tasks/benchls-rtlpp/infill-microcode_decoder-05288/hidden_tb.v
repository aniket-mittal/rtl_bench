// Hidden tests: 5000 cycles of seeded random inputs (seed 247127704); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 39;
  reg clk;
  reg [48:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_05288 dut (
    .clk(clk),
    .ir(i_0),
    .idebug(i_1),
    .iwrited(i_2),
    .nop(i_3),
    .reset(i_4),
    .funct(out_dut[38:35]),
    .dest(out_dut[34:34]),
    .div(out_dut[33:33]),
    .imod(out_dut[32:32]),
    .iralu(out_dut[31:31]),
    .irbyte(out_dut[30:30]),
    .irdisp(out_dut[29:29]),
    .irjump(out_dut[28:28]),
    .mul(out_dut[27:27]),
    .destlc(out_dut[26:26]),
    .destintctl(out_dut[25:25]),
    .destpdltop(out_dut[24:24]),
    .destpdl_p(out_dut[23:23]),
    .destpdl_x(out_dut[22:22]),
    .destpdlx(out_dut[21:21]),
    .destpdlp(out_dut[20:20]),
    .destspc(out_dut[19:19]),
    .destimod0(out_dut[18:18]),
    .destimod1(out_dut[17:17]),
    .destvma(out_dut[16:16]),
    .destmdr(out_dut[15:15]),
    .destmem(out_dut[14:14]),
    .destm(out_dut[13:13]),
    .srcdc(out_dut[12:12]),
    .srcspc(out_dut[11:11]),
    .srcpdlptr(out_dut[10:10]),
    .srcpdlidx(out_dut[9:9]),
    .srcpdltop(out_dut[8:8]),
    .srcopc(out_dut[7:7]),
    .srcq(out_dut[6:6]),
    .srcvma(out_dut[5:5]),
    .srcmap(out_dut[4:4]),
    .srcmd(out_dut[3:3]),
    .srclc(out_dut[2:2]),
    .srcspcpop(out_dut[1:1]),
    .srcpdlpop(out_dut[0:0])
  );
  rtlpp_05288__ref ref_i (
    .clk(clk),
    .ir(i_0),
    .idebug(i_1),
    .iwrited(i_2),
    .nop(i_3),
    .reset(i_4),
    .funct(out_ref[38:35]),
    .dest(out_ref[34:34]),
    .div(out_ref[33:33]),
    .imod(out_ref[32:32]),
    .iralu(out_ref[31:31]),
    .irbyte(out_ref[30:30]),
    .irdisp(out_ref[29:29]),
    .irjump(out_ref[28:28]),
    .mul(out_ref[27:27]),
    .destlc(out_ref[26:26]),
    .destintctl(out_ref[25:25]),
    .destpdltop(out_ref[24:24]),
    .destpdl_p(out_ref[23:23]),
    .destpdl_x(out_ref[22:22]),
    .destpdlx(out_ref[21:21]),
    .destpdlp(out_ref[20:20]),
    .destspc(out_ref[19:19]),
    .destimod0(out_ref[18:18]),
    .destimod1(out_ref[17:17]),
    .destvma(out_ref[16:16]),
    .destmdr(out_ref[15:15]),
    .destmem(out_ref[14:14]),
    .destm(out_ref[13:13]),
    .srcdc(out_ref[12:12]),
    .srcspc(out_ref[11:11]),
    .srcpdlptr(out_ref[10:10]),
    .srcpdlidx(out_ref[9:9]),
    .srcpdltop(out_ref[8:8]),
    .srcopc(out_ref[7:7]),
    .srcq(out_ref[6:6]),
    .srcvma(out_ref[5:5]),
    .srcmap(out_ref[4:4]),
    .srcmd(out_ref[3:3]),
    .srclc(out_ref[2:2]),
    .srcspcpop(out_ref[1:1]),
    .srcpdlpop(out_ref[0:0])
  );

  task check;
    begin
      bad = 0;
      for (b = 0; b < OW; b = b + 1)
        if (out_ref[b] !== 1'bx && out_dut[b] !== out_ref[b]) bad = 1;
      if (bad) begin
        mismatches = mismatches + 1;
        if (shown < 10) begin
          $display("MISMATCH cycle %0d: expected=%h got=%h", c, out_ref, out_dut);
          shown = shown + 1;
        end
      end
    end
  endtask

  initial begin
    seed = 247127704;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed), $random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
